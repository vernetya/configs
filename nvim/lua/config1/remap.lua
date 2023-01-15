vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")

vim.keymap.set("i", "jj", "<Esc>")

-- go last/first character
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "gh", "_")

-- move line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remove crfl without losing cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- redo
vim.keymap.set("n", "U", "<C-R>")

-- do real delete instead of cut
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'c', '"_c')
vim.keymap.set({'n', 'v'}, 'd', '"_d')

-- use leader to register into unnamed register
vim.keymap.set({'n', 'v'}, '<leader>x', '""x')
vim.keymap.set({'n', 'v'}, '<leader>c', '""c')
vim.keymap.set({'n', 'v'}, '<leader>d', '""d')

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- copy/paste from clipboard
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'x'}, '<leader>y', '"+y')

-- clear search highlight 
vim.keymap.set('', '<leader>h', ':nohl<CR>', { silent = true } )

-- auto commands
local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'Visual', timeout = 1000})
  end
})
