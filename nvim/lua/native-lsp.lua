vim.lsp.config('luals', {
  on_attach = function()
    print('luals is now active in this file')
  end,
})
if not string.match(vim.g.hostname, "cs.purdue.edu") then
  vim.lsp.enable("luals")
end


vim.lsp.config('pyright', {
  on_attach = function()
    print('pyright is now active in this file')
  end,
})

vim.lsp.enable("pyright")


vim.lsp.config('clangd', {
  on_attach = function()
    print('clangd is now active in this file')
  end,
})

vim.lsp.enable("clangd")

vim.lsp.config('tailwind-ls', {
  on_attach = function()
    print('tailwind-ls is now active in this file')
  end,
})

vim.lsp.enable("tailwind-ls")

vim.lsp.config('zls', {
  on_attach = function()
    print('zls is now active in this file')
  end,
})

vim.lsp.enable("zls")

-- https://lsp-zero.netlify.app/blog/lsp-client-features.html

vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess:append('c')

