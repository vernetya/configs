-- line numer ----------------------------------------
vim.opt.relativenumber = true
vim.opt.number = true


-- seach options ----------------------------------------
vim.opt.ignorecase = true -- ignore case in general
vim.opt.smartcase = true -- ignore uppercase unless search term start up letter
vim.opt.incsearch = true
-- vim.opt.hlsearch = false -- disable highlight of previous search


-- remap --------------------------------------------------
vim.g.mapleader = " "


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


-- hop.nvim
require'hop'.setup()

-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>s", "<cmd>HopWord<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>l", "<cmd>HopLine<CR>", {noremap=true})

-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>s", "<cmd>HopWord<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>l", "<cmd>HopLine<CR>", {noremap=true})


-- normal mode (sneak-like)
vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar1CurrentLine<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2<CR>", {noremap=false})

-- visual mode (sneak-like)
vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar1CurrentLine<CR>", {noremap=false})
vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2CR>", {noremap=false})


if vim.g.vscode then
    -- VSCode extension
    vim.keymap.set('v', 'J', '<Cmd>call VSCodeCall("editor.action.moveLinesDownAction")<CR>', {noremap=true})
    vim.keymap.set('v', 'K', '<Cmd>call VSCodeCall("editor.action.moveLinesUpAction")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>fs', '<Cmd>call VSCodeCall("workbench.action.findInFiles")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>fr', '<Cmd>call VSCodeCall("references-view.findReferences")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>ff', '<Cmd>call VSCodeCall("workbench.action.quickOpen")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>g', '<Cmd>call VSCodeCall("workbench.action.gotoLine")<CR>', {noremap=true})
    vim.keymap.set('n', 'g]', '<Cmd>call VSCodeCall("editor.action.marker.next")<CR>', {noremap=true})
    vim.keymap.set('n', 'g[', '<Cmd>call VSCodeCall("editor.action.marker.prev")<CR>', {noremap=true})

    -- Git spawn
    vim.keymap.set('n', '<leader>git', '<Cmd>call VSCodeCall("git-graph.view")<CR>', {noremap=true})
    
    -- focus file explorer - project view
    vim.keymap.set('n', '<leader>pv', '<Cmd>call VSCodeCall("workbench.files.action.focusFilesExplorer")<CR>', {noremap=true})
    
    -- bookmark and jump - low but working alternative of harpoon
    vim.keymap.set('n', '<leader>t1', '<Cmd>call VSCodeCall("numberedBookmarks.toggleBookmark1")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>t2', '<Cmd>call VSCodeCall("numberedBookmarks.toggleBookmark2")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>t3', '<Cmd>call VSCodeCall("numberedBookmarks.toggleBookmark3")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>t4', '<Cmd>call VSCodeCall("numberedBookmarks.toggleBookmark4")<CR>', {noremap=true})

    vim.keymap.set('n', '<leader>1', '<Cmd>call VSCodeCall("numberedBookmarks.jumpToBookmark1")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>2', '<Cmd>call VSCodeCall("numberedBookmarks.jumpToBookmark2")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>3', '<Cmd>call VSCodeCall("numberedBookmarks.jumpToBookmark3")<CR>', {noremap=true})
    vim.keymap.set('n', '<leader>4', '<Cmd>call VSCodeCall("numberedBookmarks.jumpToBookmark4")<CR>', {noremap=true})
    

    
    -- require vscode-harpoon vs plugin
    -- vim.keymap.set('n', '<leader>e', '<Cmd>call VSCodeCall("vscode-harpoon.editEditors")<CR>', {noremap=true})
    -- vim.keymap.set('n', '<leader>t', '<Cmd>call VSCodeCall("vscode-harpoon.addEditor")<CR>', {noremap=true})
    -- vim.keymap.set('n', '<leader>1', '<Cmd>call VSCodeCall("vscode-harpoon.gotoEditor1")<CR>', {noremap=true})
    -- vim.keymap.set('n', '<leader>2', '<Cmd>call VSCodeCall("vscode-harpoon.gotoEditor2")<CR>', {noremap=true})
    -- vim.keymap.set('n', '<leader>3', '<Cmd>call VSCodeCall("vscode-harpoon.gotoEditor3")<CR>', {noremap=true})
    -- vim.keymap.set('n', '<leader>4', '<Cmd>call VSCodeCall("vscode-harpoon.gotoEditor4")<CR>', {noremap=true})

else
    -- ordinary Neovim
end
