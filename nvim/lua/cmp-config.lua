-- Set up nvim-cmp.
local cmp = require'cmp'


vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#002b36" }) -- Solarized Dark background
vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#586e75", bg = "#002b36" }) -- Border color

vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#839496", bg = "NONE" }) -- Regular text
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#268bd2", bg = "NONE", bold = true }) -- Matched text
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#2aa198", bg = "NONE", italic = true }) -- Fuzzy match

vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#b58900", bg = "NONE" }) -- Kinds (Function, Variable, etc.)
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#657b83", bg = "NONE" }) -- Menu description



cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

      -- For `mini.snippets` users:
      -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
      -- insert({ body = args.body }) -- Insert at cursor
      -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
      -- require("cmp.config").set_onetime({ sources = {} })
    end,
  },
    window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),  -- Use Tab for completion
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),  -- Use Shift-Tab for previous completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm completion with Enter
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

