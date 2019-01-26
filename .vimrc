"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml = '~/'
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" Encoding
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

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
