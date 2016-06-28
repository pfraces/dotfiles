" ----------
" extensions
" ----------

Plug 'tpope/vim-vinegar' " improved netrw
let g:netrw_dirhistmax = 0 " disable .netrwhist file creation

Plug 'hkupty/nvimux' " tmux replacement
Plug 'tpope/vim-commentary' " comment/uncomment code
Plug 'SirVer/ultisnips' " code snippets

Plug 'editorconfig/editorconfig-vim' " editorconfig integration

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

" syntax highlight and indentation
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }

" linter
Plug 'neomake/neomake'
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': function('RemotePlugin') }
Plug 'carlitux/deoplete-ternjs'
let g:deoplete#enable_at_startup = 1
