" use Q to execute default register (shadows ex mode)
nnoremap Q @q 

" tab indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <lt>gv
nnoremap <Tab> >>
nnoremap <S-Tab> <lt><lt>

" clear search with [ESC]
nnoremap <silent> <Esc> :noh<CR>

" enter NORMAL mode in term
tnoremap <Esc> <C-\><C-n>

" --------------
" [alt] mappings
" --------------

" move between windows <https://neovim.io/doc/user/nvim_terminal_emulator.html>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <silent> <A-x> :call <sid>closePreviewOrCurrentWindow()<CR>
inoremap <silent> <A-x> <Esc>:call <sid>closePreviewOrCurrentWindow()<CR>

" -----------------
" <leader> mappings
" -----------------

" Quickly edit/reload the vimrc file
nmap <silent> <leader>r :so $MYVIMRC<CR>

" -------
" helpers
" -------

function! s:isPreviewWindowOpened()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&previewwindow") | return 1 | endif
  endfor

  return 0
endfunction

function! s:closePreviewOrCurrentWindow()
  if s:isPreviewWindowOpened() | pclose
  else | close
  endif
endfunction
