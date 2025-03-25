vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>\\", ":nohlsearch<CR>")

-- easier to move windows
vim.keymap.set("n", "`h", "<C-w>h")
vim.keymap.set("n", "`l", "<C-w>l")

vim.keymap.set("n", "<leader>qr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>qf", vim.lsp.buf.format)

-------- PLUGINS -------

-- Telescope
local ts_builtins = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', ts_builtins.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ts_builtins.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fb', ts_builtins.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', ts_builtins.help_tags, { desc = 'Telescope help tags' })

-- Undo Tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
