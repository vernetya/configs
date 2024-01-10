return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    version = "*", -- comment to not follow only stable versions
    keys = {
        { "<leader>cd", mode = { "n" }, ":lua require('neogen').generate()<CR>", desc = "generate docstring" },
    },
    config = function()
        local neogen = require("neogen")
        neogen.setup({
            enabled = true,
            snippet_engine = "luasnip",
            languages = {
                python = {
                    template = {
                        annotation_convention =
                        "reST" -- for a full list of annotation_conventions, see supported-languages below,
                    }
                },
            }
        })
        -- local opts = { noremap = true, silent = true, desc = "generate docstring" }
        -- vim.api.nvim_set_keymap("n", "<Leader>cd", ":lua require('neogen').generate()<CR>", opts)
    end
}
