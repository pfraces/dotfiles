function! nvide#checkDependencies()
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endfunction

function! nvide#update()
  PlugUpdate
  PlugUpgrade
  UpdateRemotePlugins
endfunction

function! s:IsPreviewWindowOpened()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&previewwindow") | return 1 | endif
  endfor

  return 0
endfunction

function! nvide#closeWindow()
  if s:IsPreviewWindowOpened() | pclose
  else | close
  endif
endfunction
