return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            -- mode = "tabs",
            -- separator_style = "slant",
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            separator_style = "thin",
            tab_size = 21,
            indicator = { style = "icon", icon = "▎" },
            -- buffer_close_icon = '',
            -- modified_icon = "●",
            -- close_icon = "",
            -- left_trunc_marker = "",
            -- right_trunc_marker = "",
        },
    },
}
