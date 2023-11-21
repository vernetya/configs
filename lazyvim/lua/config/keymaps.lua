-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("i", "jj", "<Esc>")

-- remove crfl without losing cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- redo
vim.keymap.set("n", "U", "<C-R>")

-- do real delete instead of cut
-- vim.keymap.set({ "n", "v" }, "X", '"_x')
-- vim.keymap.set({ "n", "v" }, "C", '"_c')
-- vim.keymap.set({ "n", "v" }, "D", '"_d')

-- dynamic replace word below the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ "n" }, "<leader><Right>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set({ "n" }, "<leader><Left>", "<cmd>BufferLineCyclePrev<cr>")
