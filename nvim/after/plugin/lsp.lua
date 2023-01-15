-- print("plugin.after lsp 3")


local lsp =  require("lsp-zero")
local rust_tools = require("rust-tools")

lsp.preset("recommended")


lsp.ensure_installed({
  'sumneko_lua',
  'rust_analyzer',
  'pyright',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
})

lsp.setup()

-- lsp remap
local function on_attach_lsp(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Go definition
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, opts) -- Go implementation
  vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, opts) -- Find References
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts) -- Go next diagnostic
  vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts) -- Go prev diagnostic
  vim.keymap.set("n", "<a-cr>", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
end


lsp.on_attach(function(client, bufnr)
  on_attach_lsp(client, bufnr)
end)

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- local function on_attach(client, buffer)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
-- end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local rust_opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach_lsp,
    -- settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      -- ["rust-analyzer"] = { -- enable clippy on save
        -- checkOnSave = { command = "clippy", },
      -- },
    --},
  },
}

rust_tools.setup(rust_opts)


vim.diagnostic.config({
    virtual_text = true,
})
