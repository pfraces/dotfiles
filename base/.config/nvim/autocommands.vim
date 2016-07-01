augroup lint
  autocmd!
  autocmd BufWritePost,BufEnter *.js Neomake
augroup END
