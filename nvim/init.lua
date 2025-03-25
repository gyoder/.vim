--
-- nvim init script by grace
--

-- Get hostname
local handle = io.popen("hostname")
local hostname = handle:read("*a") or ""
handle:close()
hostname = hostname:gsub("%s+", "")
vim.g.hostname = hostname

-- add required things to path
if string.match(hostname, "cs.purdue.edu") then
  vim.env.PATH = vim.env.PATH .. ':' .. os.getenv("HOME") .. '/clangd/bin:/u/riker/u98/cs240/bin'
end

require("plugins")
require("native-lsp")
require("diagnostics")
require("remap")

vim.cmd("source ~/.vim/settings.vim")



