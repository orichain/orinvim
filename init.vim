" --- 1. CORE SETTINGS & UI ---
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=","
lua require("init")

set nocompatible
set encoding=utf-8 
set fileformat=unix 
syntax on 
set number
set termguicolors
set completeopt=menu,menuone,noselect
set cmdheight=2
set t_BE= 
set backspace=indent,eol,start 
set listchars=space:·,tab:>\-,eol:¬,
hi SpecialKey ctermfg=DarkGray
set dir=~/.cache/nvim/swap
set ignorecase smartcase
set hlsearch
set cursorline
set cursorlineopt=both
set linebreak 
set conceallevel=0
set breakindent
set nosmartindent
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=nv
set mousemodel=popup
set clipboard+=unnamedplus

" --- 2. FUNCTION KEYS (F1-F12) ---
map  <silent> <F2> :set list<CR> 
map  <silent> <F3> :set nolist<CR> 
imap <silent> <F2> <Esc>:set list<CR>a
imap <silent> <F3> <Esc>:set nolist<CR>a
noremap <F5> :.!xmllint --format --recover - 2>/dev/null<CR> 
noremap <F6> :%s/</\r</g<CR>
nnoremap <F7> :botright 15split term://ksh<CR>i

" --- 3. MAPPINGS: LEADER (a-z) ---
noremap <leader>ad :lua require('cmp').setup.buffer { enabled = false }<CR>
noremap <leader>bc :bd!<CR>
noremap <leader>bC :%bd!<CR>
noremap <leader>c "+y
nnoremap <leader>d "_d
nnoremap <leader>e :Neotree toggle<CR>
noremap <leader>f :Telescope find_files<CR>
noremap <leader>ff :Telescope current_buffer_fuzzy_find<CR>
noremap <leader>g :Telescope live_grep<CR>
noremap <leader>m :set mouse=a<CR>
noremap <leader>md :set mouse=<CR>
xnoremap <leader>p "_dP
map     <leader>r :call MISC_GlobalReplace()<cr>
noremap <leader>w :w<CR>
noremap <leader>xq :bd<CR>
noremap <leader>xQ :confirm qall<CR>
nnoremap <leader>, :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <leader>. :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
map <leader><Right> :vertical resize +10<CR>
map <leader><Left>  :vertical resize -10<CR>

" --- 4. MAPPINGS: LOCAL LEADER ---
noremap <LocalLeader>b :Telescope buffers<CR>
noremap <LocalLeader>g :Telescope live_grep<CR>
noremap <LocalLeader>ht :Telescope help_tags<CR>
noremap <LocalLeader>lr :Telescope lsp_references<CR>
noremap <LocalLeader>gb :Telescope git_branches<CR>
noremap <LocalLeader>gc :Telescope git_commits<CR>
noremap <LocalLeader>ph :Telescope neovim-project history<CR>
noremap <LocalLeader>pd :Telescope neovim-project discover<CR>
noremap <LocalLeader>p :Telescope neovim-project neovim-project<CR>
noremap <LocalLeader>pp :Telescope neovim-project neovim-project<CR>

" --- 5. NAVIGATION & TERMINAL ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <C-j> 5j
noremap <C-k> 5k
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap [b    :bprevious<CR>
nnoremap ]b    :bnext<CR>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-c> <C-\><C-n><C-w>k
tnoremap <F7> <C-\><C-n><C-w>k
" --- 5.a. Memetakan Shift + Arrow Untuk Selection Text
set keymodel=startsel,stopsel
set selection=inclusive
nnoremap <Esc>[1;2A v<Up>
nnoremap <Esc>[1;2B v<Down>
nnoremap <Esc>[1;2D v<Left>
nnoremap <Esc>[1;2C v<Right>
vnoremap <Esc>[1;2A <Up>
vnoremap <Esc>[1;2B <Down>
vnoremap <Esc>[1;2D <Left>
vnoremap <Esc>[1;2C <Right>
inoremap <Esc>[1;2A <Esc>v<Up>
inoremap <Esc>[1;2B <Esc>v<Down>
inoremap <Esc>[1;2D <Esc>v<Left>
inoremap <Esc>[1;2C <Esc>v<Right>
" --- 5.b. Home & End
nnoremap <Home> ^
nnoremap <End>  $
inoremap <Home> <Esc>^i
inoremap <End>  <Esc>$a
" ------------------------------------------------------

" --- 6. MISC & INSERT MODE ---
nmap gl :!xdg-open <c-r><c-a><CR>
nmap gx :!xdg-open <c-r><c-a>
imap <Insert> <Nop>
inoremap <S-Insert> <Insert>
imap <S-Insert> <C-R>*

" --- 7. AUTOCMDS & PLUGIN SETTINGS ---
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null 
autocmd TermLeave * if &buftype == 'terminal' | silent! bd! | endif

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.md set number relativenumber
au BufNewFile,BufRead *.md :au TextChanged,TextChangedI <buffer> silent write
au BufNewFile,BufFilePre,BufRead *.md lua require('cmp').setup.buffer { enabled = false }
au BufNewFile,BufFilePre,BufRead *.md :TSBufEnable highlight 
au BufNewFile,BufFilePre,BufRead vagrantfile set filetype=ruby

" Markdown Plugin Vars
let g:mkdx#settings = { 'highlight': { 'enable': 1 }, 'enter': {'enable':1, 'shift': 1, 'o':1 }, 'links': { 'external': { 'enable': 1 } }, 'auto_update': {'enble': 1}, 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 }, 'fold': { 'enable': 1, 'fold': { 'components': ['toc', 'fence'] } }}
let g:mkdx#settings.gf_on_steroids = 0
let g:markdown_fenced_languages = ['bash', 'sql','javascript']
let g:markdown_enable_spell_checking = 0
let g:vim_markdown_conceal = 0
au FileType markdown let g:indentLine_setConceal = 0

" --- 8. COMMANDS ---
command -nargs=1 Meeting !cd Meetings/;~/bin/meetingmaker <args>

