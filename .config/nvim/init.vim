" Gross, right? https://github.com/chriskempson/base16-vim/issues/197
function FixupBase16(info)
  !sed -i '/Base16hi/\! s/a:\(attr\|guisp\)/l:\1/g' ~/.vim/bundle/base16-vim/colors/*.vim
endfunction

" Vundle and plugin config.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.config/nvim')
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'lifepillar/vim-mucomplete'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'chrisbra/vim-diff-enhanced'

" syntax highlighting and colours
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'JulesWang/css.vim'
Plug 'jparise/vim-graphql'
Plug 'chriskempson/base16-vim', { 'do': function('FixupBase16') }
call plug#end()
filetype plugin indent on
syntax enable

" General config.
set nocompatible
set encoding=utf-8
set path=$PWD/**
set synmaxcol=120

" Make it pretty.
set termguicolors
colorscheme base16-dracula

" Repaint mapping
nmap <leader>r :redraw!<CR>

" Autocomplete setup
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
nmap <Leader>m :MUcompleteAutoToggle<CR>

" Airline config.
set laststatus=2
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 0

" Useful linter functions
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
    silent execute "normal! k==j"
  endif
endfunction

function RunPrettier()
  silent execute "silent !prettier --write " . bufname("%")
  redraw!
  edit!
endfunction

" Lint typescript files as JS
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.tsx set filetype=javascript.jsx
augroup END

let g:ale_linters = {'jsx': ['eslint']}

" Lint ruby files with rubocop
let g:ale_ruby_rubocop_executable = 'bin/rubocop'

" Linter bindings
nmap <silent> [v <Plug>(ale_previous_wrap)
nmap <silent> ]v <Plug>(ale_next_wrap)
nmap <silent> <C-l> :call IgnoreLinter()<CR>
nmap <silent> <C-p> :call RunPrettier()<CR>

" Always show git gutter.
set signcolumn=yes

" Binding to switch git gutter to diff against HEAD^
nmap <Leader>0 :let g:gitgutter_diff_base = 'HEAD^'<CR>
nmap <Leader>1 :let g:gitgutter_diff_base = 'HEAD^^'<CR>
nmap <Leader>2 :let g:gitgutter_diff_base = 'HEAD^^^'<CR>
nmap <Leader>3 :let g:gitgutter_diff_base = 'HEAD^^^^'<CR>
nmap <Leader>4 :let g:gitgutter_diff_base = 'HEAD^^^^^'<CR>
nmap <Leader>5 :let g:gitgutter_diff_base = 'HEAD^^^^^^'<CR>
nmap <Leader>6 :let g:gitgutter_diff_base = 'HEAD^^^^^^^'<CR>
nmap <Leader>7 :let g:gitgutter_diff_base = 'HEAD^^^^^^^^'<CR>
nmap <Leader>8 :let g:gitgutter_diff_base = 'HEAD^^^^^^^^^'<CR>
nmap <Leader>9 :let g:gitgutter_diff_base = 'HEAD^^^^^^^^^^'<CR>

" Git gutter uses this but it's technically vim-wide config.
set updatetime=200

" Swap files annoy me.
set noswapfile

" Basic indent, tab, and line settings.
set number
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

" Open file in Chrome.
nmap <silent> <leader>^ :! /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR>

" Spell-check git commit messages
autocmd FileType gitcommit setlocal spell

" Tab-autocomplete options.
set wildchar=<TAB> wildmenu wildmode=list:longest,full

" Highlight trailing whitespace with dots
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

" Turns out S-j is kinda useful :p
noremap <C-j> <S-j>

" Make newlines more easily.
nmap <CR> o<Esc>

" Insert single character from normal mode
nmap <C-i> i_<Esc>r

" Copy current filename to system clipboard.
nmap <Leader>% :let<Space>@*=@%<CR>

" Easier mode-switch mappings.
map! <Leader><Leader> <Esc>

" Easier common operations.
nmap <Leader><Leader> :w!<CR>
nmap <Leader><Bs> :w<CR>:bd<CR>

" Pull up :registers more easily
nnoremap <Leader>" :registers<CR>

" Re-run previous : command more easily
nnoremap <Leader>: @:

" Re-run previous command on each line in a visual selection
vnoremap . :norm.<CR>

" FZF
nmap <Leader>o :FZF<CR>
nmap <Leader>p :Buffers<CR>
nmap <Leader>f :BLines
nmap <Leader>g :Lines

" Open and close and switch buffers more easily.
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>c :bd<CR>
nmap <Leader>n :bn<CR>
nmap <Leader>b :bp<CR>
nmap ]] :bn<CR>
nmap [[ :bp<CR>
