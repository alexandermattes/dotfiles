
"""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""

" don't need to be compatible with old vim
set nocompatible

" Set default encoding
set encoding=utf8

" Enable syntax highlighting
syntax on

" Sets how many lines of history VIM has to remember
set history=1000

" Set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" Use normal system clippboard (Ctrl-C, Ctrl-V)
set clipboard=unnamedplus

" Hides buffers instead of closing them
set hidden

" Don't redraw while executing macros (good performance config)
set lazyredraw


"""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""

" Local dirs
if !has('win32')
  set backupdir=$DOTFILES/caches/vim
  set directory=$DOTFILES/caches/vim
  set undodir=$DOTFILES/caches/vim
  let g:netrw_home = expand('$DOTFILES/caches/vim')
endif


"""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

" Show position
set ruler

" Show bracket matches
set showmatch

" Tab completion Menu
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc

" Height of command bar
set cmdheight=1

" Always show status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" => Text, tab ind indent related
"""""""""""""""""""""""""""""""""""""""""

" Linebreaking
set textwidth=200
set linebreak

" Use spaces instead of tabs
set expandtab

" Length of a single tab
set tabstop=8

" How many spaces are inserted when you press tab
set shiftwidth=4

" Take indentation from previous line
set autoindent

" File-type basend indentation
if has('autocmd')
  filetype plugin indent on
endif


"""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


"""""""""""""""""""""""""""""""""""""""""
" => Design
"""""""""""""""""""""""""""""""""""""""""

" The colorscheme
colorscheme desert

" Tell vim what the background color looks like
set background=dark

" Use 256 colors
set t_Co=256


"""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""

" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
" Plug 'bling/vim-airline'
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' " Surround objects with tags,{,[,( etc. using ys, cs, ds etc.
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat' " Allow to use . for some other plugins
Plug 'tpope/vim-commentary' " Add comments with gc
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-eunuch'
" Plug 'scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'fatih/vim-go', {'for': 'go'}
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" Plug 'mhinz/vim-signify'
" Plug 'mattn/emmet-vim'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'chase/vim-ansible-yaml'
" Plug 'wavded/vim-stylus'
" Plug 'klen/python-mode', {'for': 'python'}
" Plug 'terryma/vim-multiple-cursors'
" Plug 'wting/rust.vim', {'for': 'rust'}
call plug#end()
