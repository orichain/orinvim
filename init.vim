" -- LEADER key keyboard shortcuts - default (\) but I use <SPACE>
"Remap LEADER to Space:
nnoremap <SPACE> <Nop>
let mapleader=" "

"------------ MY CUSTOMIZATIONS --------------------------------
"  ------ Reading, focus mode, etc
"-------------------------------------------------------------------

set termguicolors
set completeopt=menu,menuone,noselect

"--------------- SETTINGS THAT HAVE TO BE LOADED BEFORE THE PLUGINS LOAD 
"------------ Nvim Tree Lua ------
nnoremap <leader>n :Neotree toggle<CR>
" nnoremap <leader>n :NvimTreeToggle<CR>
" nnoremap <leader>f :NvimTreeFindFile<CR>


"--------------- SOURCE LUA FILES
lua require("init")
"lua require("plugins")

"-------------FORMATTING-------------------------
"Line numbers, backspace, whitespace chars, formatting

set encoding=utf-8 
"set relativenumber
set t_BE= "fix pasting that messes up some brackets
set number
set backspace=indent,eol,start 
set listchars=space:·,tab:>\-,eol:¬,
hi SpecialKey ctermfg=DarkGray
"Some more settings
set fileformat=unix 
set cmdheight=2
set nocompatible  "let's not pretend we are vi
set ignorecase smartcase "awesome option to only search case sensitive when at least on uppercase character is used

"" ---------- Persistent undo, not sure if I need it right now:
"set undofile
"set undodir=~/.cache/nvim/undo
"" ---------- End of persitent undo

"" --------- Caching 
" Cache to home directory
set dir=~/.cache/nvim/swap "configure swap folder to be in line with vim's defaults
syntax on 
" Set visual line wrap settings, use set nowrap to disable wrapping
set linebreak 
" Do not conceal any characters
set conceallevel=0
" Set breakindent to keep the same level of indentation
set breakindent
set nosmartindent

" I like default nvim theme, just want to use different bg. Pick a color here: https://jonasjacek.github.io/colors/
"hi Normal ctermbg=235 
"highlight markdownCode ctermfg=12 guifg=Green
""""""highlight markdownCode guifg=Green


"--- GLOBAL SETTINGS WARNING !!! -------------------------
" These global settings can disrupt plugin function or get actually overwritten
set tabstop=2 "tab width set to two spaces
set shiftwidth=2 "number of spaces for auto-indent width
set expandtab "expand tabs to spaces


"" -- Cursorline -----------------------------------------------------
" Enable cursor line highlight & disable underline on selection (needed only for some themes like slateblue)
set cursorline
set cursorlineopt=both
"" Uncomment to fix cursorline highlight in default vim color scheme:
"hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=Black


"------------- GENERAL SETTINGS (tmp, backups, interface etc...)--
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Synchronize current directory with working directory (WARNING! Might interfere with some plugins!!)
"autocmd BufEnter * lcd %:p:h

" Copy yanks and deletes to system clipboard
"set clipboard+=unnamedplus
" Auto identation 
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null 
 
 
" Enable highlighting for the search via / 
set hlsearch 
"hi Search guibg=LightBlue 


"-------- Spellcheck  ---------------------------------------------
set spelllang=en_us
" Disable spellcheck by default
set nospell
" Fold only areas with more than 40 lines
set foldlevel=0
set foldminlines=40
set foldmethod=expr

"--------- Syntax, highlighting related settings ------------------
" Markdown related autocomannds:
"Auto-recognize .md files as Markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" User hybrid relative numbers for markdown files only
au BufNewFile,BufFilePre,BufRead *.md set number relativenumber
" Autosave the buffer after edit (for Markdown files only)
au BufNewFile,BufRead *.md :au TextChanged,TextChangedI <buffer> silent write
"au BufNewFile,BufRead *.md :au TextChanged,TextChangedI <buffer> write
" Disable CMP auto-completion for Markdown
au BufNewFile,BufFilePre,BufRead *.md lua require('cmp').setup.buffer { enabled = false }
" Enable TreeSitter for Markdown files
au BufNewFile,BufFilePre,BufRead *.md :TSBufEnable highlight 

" Relative numbers plus actual number
"set number relativenumber

"Auto-recognize vagrantfiles
au BufNewFile,BufFilePre,BufRead vagrantfile set filetype=ruby



"----- PLUGIN Settings


"---------------------------- MKDX markdown settings
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': {'enable':1, 'shift': 1, 'o':1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'auto_update': {'enble': 1},
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1, 'fold': { 'components': ['toc', 'fence'] } }}
                      "  \ 'gf_on_steroids': {'enable': 1},
let g:mkdx#settings.gf_on_steroids = 0

let g:markdown_fenced_languages = ['bash', 'sql','javascript']
"--------------------------- Git flavoured markdown highlight settings rhysd/vim-gfm-syntax
"let g:markdown_fenced_languages = ['bash', 'python', 'ansible']

" Disable spell check in 'gabrielelana/vim-markdown'
let g:markdown_enable_spell_checking = 0
let g:vim_markdown_conceal = 0
"disable conceal for the markdown files (indent line plugin sets it to level 2 by default)
au FileType markdown let g:indentLine_setConceal = 0


"----- KEY BINDINGS---------

"---- OVERRIDES --
"-- Overries of default bindings

" Open link under cursor (fix overrides by other plugins)
nmap gl :!xdg-open <c-r><c-a><CR>
nmap gx :!xdg-open <c-r><c-a>


"----- CUSTOM BINDS
"-- Leader binds, extra commands, etc.


"Disable REPLACE mode on second insert press
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>


" yank to system clipboard with <leader> + c
noremap <leader>c "+y
" save the current file with <leader> + z
noremap <leader>s :w<CR>
" Quick paste over selected block
"noremap <leader>p 1vp

" Paste over
xnoremap <leader>p "_dP
" Delete without yanking with <leader>d
nnoremap <leader>d "_d
" Add newline under/above the current line without entering insert mode with <leader>o or <leader>O
"nmap <leader>o o<Esc>k
"nmap <leader>O O<Esc>j
"enable mouse everywhere
noremap <leader>m :set mouse=a<CR>
noremap <leader>md :set mouse=<CR>

" MOVEMENT MAPPING
" Jump to the line with same indentation with <leader>, and <leader>.
nnoremap <leader>, :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <leader>. :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
" Scroll faster with Ctrl+j or Ctrl+k
noremap <C-j> 5j
noremap <C-k> 5k

" Reload buffer
"noremap <leader>b :bufdo e<CR>

" Resize vertical split with <leader> left or right arrow
map <leader><Right> :vertical resize +10<CR>
map <leader><Left> :vertical resize -10<CR>

" Unload (quit) buffer, works only if there was no change
noremap <leader>q :bd<CR>
" close all buffers but the current one
"noremap <leader>qb :%bd|e#<CR>
" Keluar dari seluruh Orinvim
noremap <leader>Q :confirm qall<CR>

" QUICK ACTIONS MAPPING
"Toggle whitespace and linebreak characters visibility 
map <silent> <F2> :set list<CR> 
map <silent> <F3> :set nolist<CR> 
"Same but for insert mode. Switch to list and go back to insert mode
imap <silent> <F2> <Esc>:set list<CR>a
imap <silent> <F3> <Esc>:set nolist<CR>a
"-- Auto pretty format XML file 
noremap <F5> :.!xmllint --format --recover - 2>/dev/null<CR> 
" simple html re-formatting withotu external tools
noremap <F6> :%s/</\r</g<CR>

"Switching to next and previous tabs by Ctrl+l and Ctrl+h 
"noremap <C-l> :n<CR> 
"noremap <C-h> :N<CR> 
"Switch to next file buffer
"nnoremap <C-n> :bnext<CR> 
"nnoremap <C-p> :bprevious<CR> 

" --- NAVIGASI JENDELA (ASTRO STYLE) ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- NAVIGASI TERMINAL & AUTO-CLOSE ---
" Setiap kali meninggalkan terminal, tutup jendela tersebut secara otomatis
autocmd TermLeave * if &buftype == 'terminal' | silent! bd! | endif

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"  ------ F7
nnoremap <F7> :botright 15split term://ksh<CR>i
tnoremap <C-c> <C-\><C-n><C-w>k
tnoremap <F7> <C-\><C-n><C-w>k

" --- NAVIGASI BUFFER / TAB ---
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>


" Open URL under the cursor only with Enter
"nmap <Enter> gx
"------------------------------ PLUGIN related key mappings ---------------------

" --- LSP related shortcust
"nmap <leader>k :call h vim.lsp.buf.hover()

" -- Temporarily disable nvim CMP completion:
noremap <leader>ad :lua require('cmp').setup.buffer { enabled = false }<CR>

"---------------- Vim telescope -----
" Find files using Telescope command-line sugar.
let maplocalleader=","
noremap <leader>f :Telescope find_files<CR>
noremap <leader>w :Telescope current_buffer_fuzzy_find<CR>
noremap <leader>ff :Telescope current_buffer_fuzzy_find<CR>
"noremap <leader>f :wq<CR>
noremap <LocalLeader>g :Telescope live_grep<CR>
noremap <leader>g :Telescope live_grep<CR>
noremap <LocalLeader>b :Telescope buffers<CR>
noremap <LocalLeader>ht :Telescope help_tags<CR>
noremap <LocalLeader>lr :Telescope lsp_references<CR>
"Telescope git
noremap <LocalLeader>gb :Telescope git_branches<CR>
noremap <LocalLeader>gc :Telescope git_commits<CR>
" Nvim project bindings
noremap <LocalLeader>ph :Telescope neovim-project history<CR>
noremap <LocalLeader>pd :Telescope neovim-project discover<CR>
noremap <LocalLeader>p :Telescope neovim-project neovim-project<CR>
noremap <LocalLeader>pp :Telescope neovim-project neovim-project<CR>

" Global search and replace <leader> r
map <Leader>e :call MISC_GlobalReplace()<cr>

" Vim minimap options
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_highlight_range = 1


" ------ GUI settings ---------------------------------------------------------
"set guifont=Noto\ Mono\ for\ Powerline:h9
"set guifont=Hack\ Nerd\ Font\ Mono:h10

" ------ Mouse settings ----------------------------------------------------------
" Enable mouse (used together with the remap option to disable drag mouse visual mode
set mouse=nv
"set guicursor=i-ci-v:ver20-nCursor
"set mouseshape=a:ver20-nCursor
"set mouseshape=nvir:beam,vs:lrsizing,vd:lrsizing,sd:udsizing,o:question,m:question
"set guicursor=a:ver30
"set guicursor=a:ver20
"set guicursor=a:beam

" Disable visual selection on mouse drag
"noremap <LeftDrag> <LeftMouse>
"noremap! <LeftDrag> <LeftMouse>

" Attempt to fix mouse drag and release bug:
" map <LeftDrag> <Nop>
" map <LeftRelease> <Nop>

" map <2-LeftMouse> <Nop>
" map! <2-LeftMouse> <Nop>


"neovide
let g:neovide_cursor_animation_length=0.009
let g:neovide_cursor_trail_length=0

" Gui pasting
" Paste by Shift+Insert in the Insert mode
imap <S-Insert> <C-R>*
" Mouse right-click in visual mode selection copies the text to system clipboard
vmap <RightMouse> "+y 
" What is this?:
"vmap <RightMouse> "*ygv


" ------- COMMAND ALIASES -------------------------------------------------------
command -nargs=1 Meeting !cd Meetings/;~/bin/meetingmaker <args>


" ------- FUNCTIONS -------------------------------------------------------------

" Image paste without plugin
function! ImgPaste()
  " Get the image URL from the clipboard using xclip
  let l:image_filename = input('Image filename: ')
  " Check if the user entered a link text
  if empty(l:image_filename)
    echo "Filename cannot be empty. Aborting."
    return
  endif
  "Build path and paste it via xclip<Up>
  let l:clipboard_image_url = system('xclip -selection clipboard -t image/png -o > ./img/' . l:image_filename . '.png')

  "Check if file is readable
  echo "Checking xclip success"
  if filereadable('./img/' . l:image_filename . '.png')
    echo "File pasted succesfuly via xclip"
  else
    echo "Xclip paste failed:" . l:clipboard_image_url
  endif  
"   " Check if the clipboard contains an image URL
"   if empty(l:clipboard_image_url)
"     echo 'Clipboard does not contain an image.'
"     return
"   endif
  " Prompt the user to enter the link text
  let l:link_text = input('Enter the link text: ')
  " Check if the user entered a link text
  if empty(l:link_text)
    echo "Link text empty, using filename: " . l:image_filename
    l:link_text = trim(l:image_filename)
  endif
  " Check if folder /img exists in the current directory, if not, create it:
  if !isdirectory('./img')
    call mkdir("./img","p")
  endif
  " Build the markdown link with the image URL and link text
  let l:markdown_link = '![' . l:link_text . '](' . './img/' . l:image_filename . '.png)'
  " Append the markdown link at the cursor position
  execute "normal! i" . l:markdown_link
endfunction


" Image paste but for Wayland
function! WlImgPaste()
  " Get the image URL from the clipboard using xclip
  let l:image_filename = input('Image filename: ')
  " Check if the user entered a link text
  if empty(l:image_filename)
    echo "Link text empty, using filename: " . l:image_filename
    l:link_text = trim(l:image_filename)
  endif
  "Build path and paste it via xclip<Up>
  let l:clipboard_image_url = system('wl-paste --type image/png > ./img/' . l:image_filename . '.png')
"   " Check if the clipboard contains an image URL
"   if empty(l:clipboard_image_url)
"     echo 'Clipboard does not contain an image.'
"     return
"   endif
  " Prompt the user to enter the link text
  let l:link_text = input('Enter the link text: ')
  " Check if the user entered a link text
  if empty(l:link_text)
    echo "Link text cannot be empty. Aborting."
    return
  endif
  " Check if folder /img exists in the current directory, if not, create it:
  if !isdirectory('./img')
    call mkdir("./img","p")
  endif
  " Build the markdown link with the image URL and link text
  let l:markdown_link = '![' . l:link_text . '](' . './img/' . l:image_filename . '.png)'
  " Append the markdown link at the cursor position
  execute "normal! i" . l:markdown_link
endfunction

" Function related key bindings
" Map a key to trigger the function in normal mode
nnoremap <leader>il :call ImgPaste()<CR>
nnoremap <leader>wil :call WlImgPaste()<CR>
