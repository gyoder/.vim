vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'



  use {
    'maxmx03/solarized.nvim',
    config = function()
      vim.o.background = 'dark'
      ---@type solarized
      local solarized = require('solarized')
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      solarized.setup({})
      vim.cmd.colorscheme 'solarized'
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require("plugins/ts") end
  }

  use 'mbbill/undotree'
  use 'mfussenegger/nvim-lint'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function() require('plugins/lualine-config') end
  }
  use {
    'm4xshen/autoclose.nvim',
    config = function() require("autoclose").setup() end
  }

  use  {
    'CRAG666/betterTerm.nvim',
    config = function() require('betterTerm').setup() end
  }

  use {
    'anurag3301/nvim-platformio.lua',
    requires = {
      {'akinsho/nvim-toggleterm.lua'},
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
    config = function()
      if not vim.g.is_purdue then
        require('platformio').setup({
          lsp = "clangd" --default: ccls, other option: clangd
          -- If you pick clangd, it also creates compile_commands.json
        })
      end
    end
  }

  use {
    "chentoast/marks.nvim",
    config = function() require('plugins/marks-config') end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }


  use { "nvim-tree/nvim-web-devicons" }
  use { "MunifTanjim/nui.nvim" }

  use { 'rafamadriz/friendly-snippets' }
  use {
    'saghen/blink.cmp',
    run = 'cargo build --release',
    config = function()
      require("plugins/blink_config")
    end
  }


  if packer_bootstrap then
    require('packer').sync()
  end
end)

