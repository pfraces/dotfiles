function! RemotePlugin(arg)
  UpdateRemotePlugins
endfunction

function! IsPreviewWindowOpened()
  for nr in range(1, winnr('$'))
    if getwinvar(nr, "&previewwindow") | return 1 | endif
  endfor

  return 0
endfunction

function! ClosePreviewOrCurrentWindow()
  if IsPreviewWindowOpened() | pclose
  else | close
  endif
endfunction
