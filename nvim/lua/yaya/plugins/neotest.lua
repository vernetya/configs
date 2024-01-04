return {
    "nvim-neotest/neotest",
    dependencies = {
        -- "nvim-dap-python",
        "nvim-neotest/neotest-python",
        "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    -- keys = {},
    --[[ opts = {
        adapters = {
            ["neotest-python"] = {
                -- Here you can specify the settings for the adapter, i.e.
                runner = "pytest",
                -- python = ".venv/bin/python",
            },
        },
    }, ]]
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    args = { "--log-level", "DEBUG" },
                    runner = "pytest",

                })
            }
        })

        -- set keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>tc", "<cmd>lua require('neotest').run.run()<cr>", { desc = "run current test" })
        keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
            { desc = "run tests in current file" })
        keymap.set("n", "<leader>td",
            "<cmd>lua require('neotest').run.run(vim.fn.input('Run tests from directory:'))<cr>",
            { desc = "run tests in current file" })
        keymap.set("n", "<leader>ta", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>",
            { desc = "run all tests" })
        keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>",
            { desc = "toggle tests summary" })
        keymap.set("n", "<F2>", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "tootgle tests summary" })
    end
}
