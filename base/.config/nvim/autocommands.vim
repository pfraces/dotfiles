augroup lint
  autocmd!
  autocmd BufWritePost,BufEnter *.js Neomake
augroup END

augroup restore_position
  autocmd!

  " resore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

augroup END
