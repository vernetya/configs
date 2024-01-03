return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 800
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local wk = require("which-key")
        wk.register({
            -- name/describe group
            ["<leader>"] = {
                t = { name = "+tab" },
                c = { name = "+code" },
                f = { name = "+fzf" },
                e = { name = "+explorer" },
            },
        })
    end,
}
