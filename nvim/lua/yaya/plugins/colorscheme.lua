return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      require("vscode").setup({
        color_overrides = {
          vscTabCurrent='#0026FF',
        }
      })
      -- load colorscheme
      vim.cmd([[colorscheme vscode]])
    end,
  }
}
