local handle = io.popen("hostname")
local hostname = handle:read("*a") or ""
handle:close()
hostname = hostname:gsub("%s+", "")
vim.g.hostname = hostname


vim.cmd("source ~/.vim/autoload/plug.vim")
vim.cmd("source ~/.vimrc")
if string.match(hostname, "cs.purdue.edu") then
  vim.env.PATH = vim.env.PATH .. ':' .. os.getenv("HOME") .. '/clangd/bin:/u/riker/u98/cs240/bin'
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


--[[
local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

local westwood_lint = {
    name = "eastwood",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "c", "cpp", "objc", "objcpp" },
    generator = helpers.generator_factory({
        command = "~kkasad/share/westwood",
        args = { "-f", "machine", "-" },
        to_stdin = true, -- clang-tidy doesn't accept code on stdin
        format = "line", -- Call on_output() for each line of output
        ignore_stderr = true, -- Ignore "NN warnings generated."
        on_output = helpers.diagnostics.from_patterns({
            {
                pattern = "^$",
                groups = { "file", "row", "col", "severity", "message", "code" },
            },
            overrides = {
                severities = {
                    note = helpers.diagnostics.severities.hint,
                },
            },
        }),
        check_exit_code = { 0, 1 }, -- Valid exit codes
    }),
}

null_ls.register(westwood_lint)
]]--
