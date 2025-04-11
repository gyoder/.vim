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
if string.match(hostname, "cs.purdue.edu") then
  require("westwood-lint")
end
require("standard-lint")

require("custom-lualine")
require("autoclose").setup()
require('betterTerm').setup()
vim.cmd("source ~/.vim/settings.vim")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

if not string.match(hostname, "cs.purdue.edu") then
  require('platformio').setup({
    lsp = "clangd" --default: ccls, other option: clangd
          -- If you pick clangd, it also creates compile_commands.json
  })
end

if string.match(hostname, "cs.purdue.edu") then
  vim.cmd("set noundofile") -- i forgor how to do this in lua so i didnt
end


require("marking")



