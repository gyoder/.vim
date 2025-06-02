vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>\\", ":nohlsearch<CR>")

vim.keymap.set("n", "<leader>vv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>vt", ":tabnew<CR>")

-- easier to move windows
vim.keymap.set("n", "`h", "<C-w>h")
vim.keymap.set("n", "`j", "<C-w>j")
vim.keymap.set("n", "`k", "<C-w>k")
vim.keymap.set("n", "`l", "<C-w>l")

vim.keymap.set("n", "<leader>qr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>qf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)

-------- PLUGINS -------

-- Telescope
local ts_builtins = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', ts_builtins.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ts_builtins.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fb', ts_builtins.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', ts_builtins.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', ts_builtins.lsp_workspace_symbols, { desc = 'Telescope find symbols' })
vim.keymap.set('n', '<leader>fts', ts_builtins.treesitter, { desc = 'Telescope find treesitter' })
vim.keymap.set('n', '<leader>fd', ts_builtins.lsp_definitions, { desc = 'Telescope find definition' })
vim.keymap.set('n', '<leader>ftd', ts_builtins.lsp_type_definitions, { desc = 'Telescope find type definition' })

-- Undo Tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Better Term

local betterTerm = require('betterTerm')
-- toggle firts term
vim.keymap.set({"n", "t"}, "<leader>tt", betterTerm.open, { desc = "Open terminal"})
-- Select term focus
-- vim.keymap.set({"n"}, "<leader>tf", betterTerm.select, { desc = "Select terminal"})
-- Create new term
local current = 2
vim.keymap.set(
    {"n"}, "<leader>tn",
    function()
        betterTerm.open(current)
        current = current + 1
    end,
    { desc = "New terminal"}
)

-- Neotree

local ntc = require('neo-tree.command')
vim.keymap.set('n', '<C-b>', function()
    local reveal_file = vim.fn.expand('%:p')
    if (reveal_file == '') then
      reveal_file = vim.fn.getcwd()
    else
      local f = io.open(reveal_file, "r")
      if (f) then
        f.close(f)
      else
        reveal_file = vim.fn.getcwd()
      end
    end
    ntc.execute({
      action = "focus",          -- OPTIONAL, this is the default value
      source = "filesystem",     -- OPTIONAL, this is the default value
      position = "right",         -- OPTIONAL, this is the default value
      reveal_file = reveal_file, -- path to file or folder to reveal
      reveal_force_cwd = true,   -- change cwd without asking if needed
      toggle = true,
    })  end,
  { desc = "Show Sidebar" }
)


