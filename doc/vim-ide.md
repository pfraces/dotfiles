use vim like an ide
===================

*   [use vim like an IDE](http://vim.wikia.com/wiki/Use_Vim_like_an_IDE)
*   [buffers vs tabs](https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)
*   [buffers](http://vim.wikia.com/wiki/Buffers)

reload config
-------------

`:so ~/.vimrc`

layout
------

>   A buffer is the in-memory text of a file.
    A window is a viewport on a buffer.
    A tab page is a collection of windows.

### buffers

*   `:e filename` create a new buffer
*   `:bad filename` create a hidden buffer
*   `:ls` list buffers
*   `:b [buffer]` move between buffers
*   `:bd [buffer]` delete buffer

[TODO] Delete buffer without closing its containing window

### windows

Create a new window

*   `:n [filename]`
*   `:vne [filename]`

Move between windows

*   `ctrl-w [hjkl]`
*   `ctrl-w p` (previous)

Close windows

*   `:q`

Resize windows

*   `ctrl-w -` (decrease height)
*   `ctrl-w +` (increase height)
*   `ctrl-w <` (decrease width)
*   `ctrl-w >` (increase width)
*   `ctrl-w _` (max height)
*   `ctrl-w |` (max width)
*   `ctrl-w =` (make windows equally wide and high)
*   `:res [n]`, `:res [+n]`, `:res [-n]`, `:vertical resize ...`

[tinymode key maps](http://www.vim.org/scripts/script.php?script_id=2223)

>   You can use ^W++- instead of ^W+^W+^W-

```vimL
nmap          <C-W>+     <C-W>+<SID>ws
nmap          <C-W>-     <C-W>-<SID>ws
nmap          <C-W><     <C-W><<SID>ws
nmap          <C-W>>     <C-W>><SID>ws
nn <script>   <SID>ws+   <C-W>+<SID>ws
nn <script>   <SID>ws-   <C-W>-<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nmap          <SID>ws    <Nop>
```

Change layout

*   `ctrl-w [HJKL]` (move current window)
*   `ctrl-w T` (move current window to new tab)
