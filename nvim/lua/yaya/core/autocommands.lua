vim.cmd [[
  augroup _general_settings
    autocmd!

    " autobind 'q' to close help, man ... pages
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>

    "highlight on yank
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 1000})

    " no longer start comment line using oO
    autocmd BufWinEnter * :set formatoptions-=cro

    " I don't know what it does
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _markdown
    autocmd!

    " auto set wrap and spell check for mardown
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
]]
