-- basic global options

-- set netrw list style as tree view (note use 'i' switch style)
vim.g.netrw_liststyle = 3

-- specify python virtualenv
-- vim.g.loaded_python3_provider = "/home/yvernet/venv_nvim/bin/python"

-- line numer ----------------------------------------
vim.opt.relativenumber = true
vim.opt.number = true

-- mouse mode always enabled ------------------------------
vim.opt.mouse = 'a'

-- seach options ----------------------------------------
vim.opt.ignorecase = true -- ignore case in general
vim.opt.smartcase = true -- ignore uppercase unless search term start up letter
vim.opt.incsearch = true
-- vim.opt.hlsearch = false -- disable highlight of previous search

-- indent config -----------------------------------------
vim.opt.expandtab = true -- transform tab into spaces, to put a real tab => CTRL-V<Tab>
-- vim.opt.autoindent = true
vim.opt.autoindent = smartindent 
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- misc visual config ----------------------------------
vim.opt.termguicolors = true -- better color range
vim.opt.scrolloff = 8 -- to always show 8 lines when scrolling up/down
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.colorcolumn = "120"
vim.opt.list = true
vim.opt.listchars = "space:·,trail:·,tab:>-"
-- vim.opt.cursorline = true -- highlight the current cursor line


-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
