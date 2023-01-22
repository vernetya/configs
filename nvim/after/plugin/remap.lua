-- print("remap after plugin")

local telescope = require('telescope.builtin')
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")


-- find/search

vim.keymap.set('n', '<leader>ff', telescope.find_files, {}) -- find in all files
vim.keymap.set('n', '<leader>fp', telescope.git_files, {}) -- find in project files (i.e. git files)
vim.keymap.set('n', '<leader>fs', function() -- do a search providing an input
  telescope.grep_string({ search = vim.fn.input("Search > ") })
end)

-- file navigation - harpoon
vim.keymap.set("n", "<leader>t", harpoon_mark.add_file) -- file tag
vim.keymap.set("n", "<leader>e", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end)

-- git status
vim.keymap.set("n", "<leader>git", vim.cmd.Git)

-- floating terminal
vim.keymap.set('n', "<leader>nt", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set('n', "<leader>tt", ":FloatermToggle myfloat<CR>")
vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- vimspector
vim.keymap.set("n", "<F5>", "<cmd>call vimspector#Launch()<cr>")
-- vim.keymap.set("n", "<F12>", "<cmd>call vimspector#Stop()<cr>")
vim.keymap.set("n", "<F4>", "<cmd>call vimspector#Reset()<cr>")
vim.keymap.set("n", "<F6>", "<cmd>call vimspector#Continue()<cr>")
vim.keymap.set("n", "<F8>", "<cmd>call vimspector#StepOver()<cr>")
vim.keymap.set("n", "<F9>", "<cmd>call vimspector#StepOut()<cr>")
vim.keymap.set("n", "<F7>", "<cmd>call vimspector#StepIn()<cr>")

vim.keymap.set('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
vim.keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
vim.keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")

