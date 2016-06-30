" use Q to execute default register (shadows ex mode)
nnoremap Q @q 

" tab indentation
vnoremap <tab> >gv
vnoremap <s-tab> <lt>gv
nnoremap <tab> >>
nnoremap <s-tab> <lt><lt>

" clear search with [ESC]
nnoremap <silent> <esc> :noh<cr>

" enter NORMAL mode in term
tnoremap <esc> <c-\><c-n>

" exit term and close its window 
tnoremap <silent> <c-d> <c-d><c-\><c-n>:q<cr>

" --------------
" [alt] mappings
" --------------

" move between windows
tnoremap <a-h> <c-\><c-n><c-w>h
tnoremap <a-j> <c-\><c-n><c-w>j
tnoremap <a-k> <c-\><c-n><c-w>k
tnoremap <a-l> <c-\><c-n><c-w>l
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

nnoremap <silent> <a-x> :call ClosePreviewOrCurrentWindow()<cr>
inoremap <silent> <a-x> <esc>:call ClosePreviewOrCurrentWindow()<cr>

" -----------------
" <leader> mappings
" -----------------

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>r :so $MYVIMRC<cr>

" window splits
nnoremap <silent> <leader>h :Vex<cr>
nnoremap <silent> <leader>j :below 10sp term://$SHELL<cr>i
nnoremap <silent> <leader>k :Ex<cr>
nnoremap <silent> <leader>l :Vex!<cr>
