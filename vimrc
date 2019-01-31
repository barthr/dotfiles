call plug#begin()
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
 Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Start deoplete on startup
let g:deoplete#enable_at_startup = 1

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
let g:python3_host_prog = '/usr/local/bin/python3'

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Taken from https://github.com/fatih/vim-go-tutorial
" Easier jumping into quickfix 
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" let g:go_highlight_types = 1
" let g:rehash256 = 1
" let g:molokai_original = 1
colorscheme dracula

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" Common go related actions
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)


" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let mapleader=" "
nmap <Leader><Leader> <c-^>

set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set autowrite


syntax enable
" set statusline=%=&P\ %f\ %m
" set fillchars=vert:\ ,stl:\ ,stlnc:\ 
" set laststatus=2
" set noshowmode

set number " line numbering
set encoding=utf8
set title

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

" More natural split opening
set splitbelow
set splitright 
