set encoding=utf-8

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'

syntax enable
filetype plugin indent on

" Swap files annoy me.
set noswapfile

" Basic indent, tab, and line settings.
set relativenumber
set ignorecase
set smartcase
set cindent
set autoindent
set smartindent
set ruler
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Easier mode-switch mapping.
map ;; <Esc>

" Add status info about command and visual modes.
set showcmd
set showmode
set laststatus=2

" Cursorline in command-mode only.
set cursorline
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

" Show a bell instead of making a noise when I make a mistake.
set visualbell

" Tab-autocomplete options.
set wildchar=<TAB> wildmenu wildmode=list:longest,full
set list listchars=trail:.

" Fix Y
map Y y$

" Highlight searches, but clear highlight on //.
set hlsearch
set incsearch
nmap // :noh<CR>

" Make it pretty.
set guifont=Monaco
set background=dark
colorscheme distinguished

" Move around files quicker.
noremap zz 30jzz30k
noremap <S-j> 10j
noremap <S-k> 10k
noremap <C-k> <C-y>
noremap <C-j> <C-e>

" Make newlines more easily.
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Open and close and split buffers more easily.
nmap <C-n> :bn<CR>
nmap <C-b> :bp<CR>
nmap <C-i> :vsp<Space>
nmap <C-o> :edit<Space>
nmap <C-p> :edit :%:h<Space>
nmap <C-l> :buffers<CR>
nmap <C-c> :bp\|bd #<CR>
nmap <C-s> <C-w>w<C-w>r

" Find stuff. Not crazy about this.
nmap <C-f> :find<Space>
set path=$PWD/app/**,$PWD/config/**,$PWD/test,$PWD/db,$PWD
