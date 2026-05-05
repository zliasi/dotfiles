syntax on
filetype plugin indent on

set encoding=utf-8
set number
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent

set incsearch
set hlsearch
set ignorecase
set smartcase

set nobackup
set noswapfile
set mouse=a
set laststatus=2
set noerrorbells
set novisualbell

set modeline
set termguicolors

set scrolloff=8
set wildmenu
set wildmode=longest:full,full
set cursorline
"set colorcolumn=80

"if !isdirectory($HOME . "/.vim/undo")
"    call mkdir($HOME . "/.vim/undo", "p")
"endif
"set undofile
"set undodir=~/.vim/undo

nnoremap <leader>w :w<CR>
nnoremap <leader><space> :nohlsearch<CR>
