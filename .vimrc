" General config.
set nocompatible
set encoding=utf-8
set path=$PWD/**
syntax enable
set synmaxcol=120

" Vundle and plugin config.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'JulesWang/css.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-distinguished'
call vundle#end()
filetype plugin indent on

" Make it pretty.
set background=dark
colorscheme distinguished

" Airline config.
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 0

" Airline mappings.
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

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

" Move around files quicker.
noremap zz 10jzz10k
noremap <S-j> 10j
noremap <S-k> 10k
noremap <C-k> <C-y>
noremap <C-j> <C-e>

" Copy current filename to system clipboard.
nmap <Leader>% :let<Space>@*=@%<CR>

" Make newlines more easily.
nmap <CR> o<Esc>

" Easier mode-switch mappings.
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
nmap <Leader>f :find<Space>
