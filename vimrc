set encoding=utf-8

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'

syntax enable
filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim

set laststatus=2
set relativenumber
set ignorecase
set cindent
set autoindent
set smartindent
set ruler
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set showcmd
set showmode

set hlsearch
set incsearch

set guifont=Monaco
set background=dark
colorscheme distinguished

nnoremap ; :

noremap n n30jzz30k
noremap N N30jzz30k
noremap zz 30jzz30k
noremap <S-j> 10j
noremap <S-k> 10k
noremap <C-k> <C-y>
noremap <C-j> <C-e>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <C-n> :bn<CR>
nmap <C-b> :bp<CR>
nmap <C-o> :edit<Space>
nmap <C-i> :vsp<Space>
nmap <C-l> :buffers<CR>
nmap <C-c> :bp\|bd #<CR>
nmap <C-s> <C-w>w<C-w>r

set cursorline
au InsertEnter * set nocursorline
au InsertLeave * set cursorline
set wildchar=<TAB> wildmenu wildmode=list:longest,full
set list listchars=trail:.
