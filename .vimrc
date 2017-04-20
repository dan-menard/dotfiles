" General config.
set nocompatible
set encoding=utf-8
set path=$PWD/**
syntax enable
set synmaxcol=120

" Vundle and plugin config.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'JulesWang/css.vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
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

" Linter config
let g:ale_linters = {
\  'scss': [],
\}

" Useful linter function
function IgnoreLinter()
  let current_violation_key = ''

  let current_buffer = bufnr('%')
  let violations_for_current_buffer = ale#engine#GetLoclist(current_buffer)

  let current_line = line(".")
  for violation in violations_for_current_buffer
    let violation_line = violation.lnum

    if violation_line == current_line
      let violation_text = violation.text
      let violation_text_length = strlen(violation_text)
      let violation_key_index = match(violation_text, "/") + 1
      let violation_key_with_closing_brace = strpart(violation_text, violation_key_index)

      let current_violation_key = substitute(violation_key_with_closing_brace, ']', '', '')
    endif
  endfor

  if current_violation_key != ''
    let append_line = current_line -1
    let append_text = "// eslint-disable-next-line " . current_violation_key

    call append(append_line, append_text)
  endif
endfunction

" Linter bindings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-l> :call IgnoreLinter()<CR>

" Git gutter config.
let g:gitgutter_sign_column_always = 1

" Git gutter uses this but it's technically vim-wide config.
set updatetime=200

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

" Easier repeat-macro
nmap Q @@

" Highlight searches, but clear highlight on //.
set hlsearch
set incsearch
nmap // :noh<CR>

" Move around files quicker.
noremap zz 10jzz10k
noremap <S-j> 10j
noremap <S-k> 10k

" Copy current filename to system clipboard.
nmap <Leader>% :let<Space>@*=@%<CR>

" Make newlines more easily.
nmap <CR> o<Esc>

" Easier mode-switch mappings.
map! <Leader><Leader> <Esc>

" Open and close and switch buffers more easily.
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>c :bp\|bd #<CR>
nmap <Leader>n :bn<CR>
nmap <Leader>b :bp<CR>
nmap ]] <Leader>n
nmap [[ <Leader>b

nmap <Leader>o :FZF<CR>
nmap <Leader>p :Buffers<CR>
