autocmd! VimEnter * if !argc() | Explore | endif
autocmd! BufWritePost,BufEnter * Neomake
