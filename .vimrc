"Easier jumping into quickfix 
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
" Fix bug in vim
let &t_ut=''

call plug#begin('~/.vim/plugged')
 Plug 'dracula/vim', { 'as': 'dracula' } 
 Plug 'https://github.com/ctrlpvim/ctrlp.vim'
 Plug 'https://github.com/tpope/vim-fugitive'
 Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme dracula 

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" fix leader key
let mapleader=" "

set termguicolors
set background=dark
set foldcolumn=2
set tabstop=4

" Fix a better file view
syntax enable

set number " line numbering
set encoding=utf8
set title
set hidden
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }


set backspace=indent,eol,start

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" CtrlP remap for searching
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
