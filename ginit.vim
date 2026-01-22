" To check if neovim-qt is running, use `exists('g:GuiLoaded')`,
" see https://github.com/equalsraf/neovim-qt/issues/219
if exists('g:GuiLoaded')
    " call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    "GuiFont! Hack:h8:l
    " GuiFont! Microsoft\ YaHei\ Mono:h10:l

    " Use shift+insert for paste inside neovim-qt,
    " see https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-325660764
    inoremap <silent>  <S-Insert>  <C-R>+
    cnoremap <silent> <S-Insert> <C-R>+

    " For Windows, Ctrl-6 does not work. So we use this mapping instead.
    nnoremap <silent> <C-6> <C-^>
endif
" Font settings
"set guifont=Noto\ Mono\ for\ Powerline:h11
"set guifont=Roboto\ Mono\ for\ Powerline:h8

" Mouse settings for gui
set mouseshape=a:beam
"set guicursor=i-ci-v:ver10-Cursor
set guicursor=a:ver20
" Map right mouse to yank to system clipboard for gui only
noremap <RightMouse> "+y
set mouse=a
