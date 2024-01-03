return {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
        require("hlchunk").setup({
            chunk = { enable = false },
            blank = { enable = false },
            line_num = { enable = false },
            indent = {
                -- chars = { "│" }
                chars = { "¦" }, -- more code can be found in https://unicodeplus.com/,
            }
        })
    end
}
