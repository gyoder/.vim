local handle = io.popen("hostname")
local hostname = handle:read("*a") or ""
handle:close()
hostname = hostname:gsub("%s+", "")
vim.g.hostname = hostname

vim.lsp.set_log_level("debug")

vim.cmd("source ~/.vim/autoload/plug.vim")
vim.cmd("source ~/.vimrc")
if string.match(hostname, "cs.purdue.edu") then
  vim.env.PATH = vim.env.PATH .. ':' .. os.getenv("HOME") .. '/clangd/bin:/u/riker/u98/cs240/bin'
else 
  vim.env.PATH = vim.env.PATH .. ':~/.rustup/toolchains/stable-aarch64-apple-darwin/bin'
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


require('lspconfig').rust_analyzer.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Integrating with nvim-cmp for completion
  cmd = { "rust-analyzer" },  -- Ensure correct executable (make sure `rust-analyzer` is installed and in your PATH)
  
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true  -- Loads the output directories of `cargo check`
      },
      procMacro = {
        enable = true  -- Enables procedural macros for Rust code
      },
      diagnostics = {
        enable = true,  -- Ensure diagnostics are enabled
      },
    },
  },
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
vim.lsp.handlers["textDocument/diagnostic"] = function(_, result, ctx, config)
  -- Check if the result is not nil and contains diagnostics
  if result and result.diagnostics then
    -- Print the diagnostics to check if the structure is correct
    print(vim.inspect(result.diagnostics))
    -- Proceed to publish diagnostics
    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
  else
    print("Received invalid diagnostics result:", vim.inspect(result))
  end
end-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml", "python", "cpp" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
