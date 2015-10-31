" Local dirs
if !has('win32')
  set backupdir=$DOTFILES/caches/vim
  set directory=$DOTFILES/caches/vim
  set undodir=$DOTFILES/caches/vim
  let g:netrw_home = expand('$DOTFILES/caches/vim')
endif


" PLUGINS

" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
" Plug 'bling/vim-airline'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-commentary'
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
