vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "open vanilla vim project explorer" })

keymap.set("n", "<C-s>", "<cmd>write<cr>", { desc = "save current buffer" })

keymap.set("i", "jj", "<Esc>", { desc = "Exit insert using jj" })

keymap.set("n", "x", '"_x', { desc = "delete single character withour copy into register" })
-- redo
keymap.set("n", "U", "<C-R>", { desc = "Exit insert using jj" })

-- paste current word (w or W) without copying replacement
keymap.set({ 'n', 'x', 'v' }, '<leader>p', 'viw\"_dP', { desc = "paste into current word" })
keymap.set({ 'n', 'x', 'v' }, '<leader>pp', '\"_ddP', { desc = "paste into current Line" })
keymap.set({ 'n', 'x', 'v' }, 'q', '\"_d', { desc = "delete to void" })

-- clear search highlight
keymap.set('', '<leader>h', ':nohl<CR>', { silent = true })


-- tab
keymap.set("n", "<leader>To", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>Tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>Txo", "<cmd>tabonly<CR>", { desc = "Close all other tab" })
keymap.set("n", "<leader><right>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader><left>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>Tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- navigation
opts.desc = "go left window"
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-Left>", "<C-w>h", opts)
opts.desc = "go bottom window"
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-Down>", "<C-w>j", opts)
opts.desc = "go top window"
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-Up>", "<C-w>k", opts)
opts.desc = "go right window"
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
opts.desc = "resize window top"
keymap.set("n", "<C-S-Up>", ":resize -2<CR>", opts)
opts.desc = "resize window down"
keymap.set("n", "<C-S-Down>", ":resize +2<CR>", opts)
opts.desc = "resize window left"
keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
opts.desc = "resize window right"
keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
opts.desc = "go next buffer"
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
opts.desc = "go previous buffer"
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv^", opts)
keymap.set("v", ">", ">gv^", opts)

-- Move text up and down
keymap.set({ "v", "x" }, "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set({ "v", "x" }, "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Move text up and down
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- replace (delete into void)
keymap.set({ "v", "x" }, "p", '"_dP', opts)
