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
set keymodel=startsel,stopsel

" --- 2. FUNCTION KEYS (F1-F12) ---
nnoremap <F7> :botright 15split term://ksh<CR>i

" --- 3. MAPPINGS: LEADER (a-z) ---
noremap <leader>a :AerialToggle! right<CR>
noremap <leader>bc :bd!<CR>
noremap <leader>bC :%bd!<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>e :Neotree toggle<CR>
noremap <leader>p :Lazy<CR>
noremap <leader>w :w<CR>
noremap <leader>xq :bd<CR>
noremap <leader>xQ :confirm qall<CR>

" --- 4. MAPPINGS: LOCAL LEADER ---

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

tnoremap <C-c> <C-\><C-n><C-w>l
tnoremap <F7> <C-\><C-n><C-w>l

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

