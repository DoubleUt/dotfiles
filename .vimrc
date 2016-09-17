"Plug

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')

" Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'

Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'

call plug#end()

" syntastic settings
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

inoremap <silent> jj <ESC>
nmap <F8> :TagbarToggle<CR>
nnoremap <silent><C-e> :NERDTreeToggle <CR>

" setting common
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

syntax on
filetype on
set number
set autoindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround

set backspace=indent,eol,start

set list
set listchars=tab:>-,trail:.
