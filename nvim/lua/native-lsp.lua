vim.lsp.config('luals', {
  on_attach = function()
    print('luals is now active in this file')
  end,
})
if not string.match(vim.g.hostname, "cs.purdue.edu") then
  vim.lsp.enable("luals")
end


vim.lsp.config('clangd', {
  on_attach = function()
    print('clangd is now active in this file')
  end,
})

vim.lsp.enable("clangd")

