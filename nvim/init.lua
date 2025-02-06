local handle = io.popen("hostname")
local hostname = handle:read("*a") or ""
handle:close()
hostname = hostname:gsub("%s+", "")
vim.g.hostname = hostname


vim.cmd("source ~/.vim/autoload/plug.vim")
vim.cmd("source ~/.vimrc")
if string.match(hostname, "cs.purdue.edu") then
  vim.env.PATH = vim.env.PATH .. ':' .. os.getenv("HOME") .. '/clangd_19.1.2/bin:/u/riker/u98/cs240/bin'
end

-- vim.cmd("source ~/.config/nvim/lua/cmp-config.lua")
require("cmp-config")
capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup({
  -- on_attach = require("completion").on_attach
  capabilities = capabilities, 
  cmd = {
    "clangd",
    -- "--clang-tidy",  -- Enable clang-tidy
    "--background-index",
  }  
})
