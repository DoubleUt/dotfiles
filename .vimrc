" Encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

filetype plugin indent on   " enable filetype plugin
syntax on                   " enabel syntax highlight

set ruler  " show current position
set number " show line numbers

" TAB, indent
set autoindent               " enable auto indent
set expandtab                " spaces instead of tabs
set smarttab                 " be smart

" 1 tab equal 4 spaces
set softtabstop=4
set tabstop=4
set shiftwidth=4

set shiftround
set backspace=2

" Abount searching
set ignorecase
set smartcase
set hlsearch
set showmatch

set list
set listchars=tab:>-,trail:.

" key bindings
inoremap <silent> jj <ESC>
set whichwrap+=h,l

" dont make any backup files
set nobackup
set nowb
set noswapfile

