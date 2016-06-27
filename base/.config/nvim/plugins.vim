" ============ 
" nvim plugins
" ============ 

Plug 'hkupty/nvimux' " tmux replacement

" ----------
" javascript
" ----------

Plug 'Shougo/deoplete.nvim' " auto-completion

Plug 'neomake/neomake' " linter hints
let g:neomake_javascript_enabled_makers = ['eslint']


" =========== 
" vim plugins
" =========== 

Plug 'tpope/vim-vinegar' " improved netrw
let g:netrw_dirhistmax = 0 " disable .netrwhist file creation

Plug 'tpope/vim-commentary' " comment/uncomment code

" -----------
" integration
" -----------

Plug 'editorconfig/editorconfig-vim' " editorconfig

" ----- 
" theme
" ----- 

Plug 'nanotech/jellybeans.vim' " color scheme


Plug 'bling/vim-airline' " status bar
let g:airline#extensions#tabline#enabled = 1 " enable top tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show only filename in tabline

" hide separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" ----------
" javascript
" ----------

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
