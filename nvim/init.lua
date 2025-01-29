local handle = io.popen("hostname")
local hostname = handle:read("*a") or ""
handle:close()
hostname = hostname:gsub("%s+", "")
vim.g.hostname = hostname


vim.cmd("source ~/.vim/autoload/plug.vim")
vim.cmd("source ~/.vimrc")
vim.env.PATH = vim.env.PATH .. ':~/clangd_19.1.2/bin'



require('lspconfig').clangd.setup({
  on_attach = custom_attach_clangd,
  cmd = { "/homes/yoder177/clangd_19.1.2/bin/clangd", "--clang-tidy" }
})
