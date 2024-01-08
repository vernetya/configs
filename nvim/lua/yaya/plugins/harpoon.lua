return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup()

        local keymap = vim.keymap -- for conciseness
        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
        keymap.set("n", "<leader>aa", function() harpoon:list():append() end,
            { desc = "append current file into harpoon" })
        keymap.set("n", "<leader>al", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "harpoon quick list" })
        keymap.set("n", "<leader>fa", function() toggle_telescope(harpoon:list()) end,
            { desc = "harpoon list in telescope" })

        keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
        keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)

        -- keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        -- keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
}
