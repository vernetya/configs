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

