vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "open vanilla vim project explorer"})

keymap.set("n", "<C-s>", "<cmd>write<cr>", {desc = "save current buffer"})

keymap.set("i", "jj", "<Esc>", {desc = "Exit insert using jj"})

keymap.set("n", "x", '"_x', {desc = "delete single character withour copy into register"})
-- redo
keymap.set("n", "U", "<C-R>", {desc = "Exit insert using jj"})

-- paste current word (w or W) without copying replacement
keymap.set({'n', 'x'}, '<leader>p', 'viw\"_dP', {desc = "paste into current word"})
keymap.set({'n', 'x'}, '<leader>P', 'viW\"_dP', {desc = "paste into current Word"})

-- clear search highlight 
keymap.set('', '<leader>h', ':nohl<CR>', { silent = true } )


keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>txo", "<cmd>tabonly<CR>", { desc = "Close all other tab" })
keymap.set("n", "<leader><right>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader><left>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })



-- auto commands
local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'Visual', timeout = 1000})
  end
})

