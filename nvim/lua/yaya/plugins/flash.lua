return {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- opts = {
    --     modes = {
    --         char = { enable = false }
    --     }
    -- },
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
    config = function()
        require("flash").setup({ modes = { char = { enabled = false } } })
    end
}
