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

" Easier mode-switch mapping.
map! <Leader><Leader> <Esc>

" Open and close and split buffers more easily.
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>n :bn<CR>
nmap <Leader>b :bp<CR>
nmap <Leader>i :vsp<Space>
nmap <Leader>o :edit<Space>
nmap <Leader>l :buffers<CR>
nmap <Leader>c :bp\|bd #<CR>
nmap <Leader>s <C-w>w<C-w>r
nmap <Leader>[ <C-w>w
nmap <Leader>] <C-w>w

" Find stuff. Not crazy about this.
nmap \f :find<Space>
set path=$PWD/app/**,$PWD/config/**,$PWD/test,$PWD/db,$PWD
