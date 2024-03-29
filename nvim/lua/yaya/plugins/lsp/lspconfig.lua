return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "lukas-reineke/lsp-format.nvim",
            -- force sync format for all filetype
            config = function()
                local config = {}
                for _, v in pairs(vim.fn.getcompletion("", "filetype")) do
                    config[v] = { sync = true }
                end
                require("lsp-format").setup(config)
            end
        },

        -- { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- import lsp-format
        local lsp_format = require("lsp-format")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, buf_nbr)
            lsp_format.on_attach(client, buf_nbr)

            opts.buffer = buf_nbr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Format code"
            keymap.set('n', '<leader>cf', function()
                vim.lsp.buf.format { async = true }
            end, opts)
            -- opts.desc = "Restart LSP"
            -- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

            --[[ keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            keymap.set('n', 'gfr', vim.lsp.buf.references, opts)
            keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts) ]]
        end


        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = { globals = { "vim" }, },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig["pylsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                pylsp = {
                    plugins = {
                        ruff = {
                            enable = true,
                            format = { "I" },
                        },

                        black = { enabled = false },
                        isort = { enabled = false },
                        pylsp_mypy = { enabled = false },
                        pylint = { enabled = false },

                        -- disable
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },

                    },
                },
            }

        })
    end
}
