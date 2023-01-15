vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")

vim.keymap.set("i", "jj", "<Esc>")

-- go last/first character
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "gh", "_")

-- redo
vim.keymap.set("n", "U", "<C-R>")
