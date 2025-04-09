vim.cmd [[packadd packer.nvim]]

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

  use 'nvim-treesitter/nvim-treesitter'
  use 'mbbill/undotree'
  use 'mfussenegger/nvim-lint'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'm4xshen/autoclose.nvim'
  use 'CRAG666/betterTerm.nvim'

  use {
    'anurag3301/nvim-platformio.lua',
    requires = {
      {'akinsho/nvim-toggleterm.lua'},
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
end)
