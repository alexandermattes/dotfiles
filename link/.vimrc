
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

" Enable mouse use in all modes
set mouse=a

" Hides buffers instead of closing them
set hidden

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Reload unmodified files if a change from outside is detected
set autoread

" Create vimrc autocmd group and remove any existing vimrc autocmds,
" in case .vimrc is re-sourced.
augroup vimrc
  autocmd!
augroup END

" Trigger autoread whenever a Buffer is switched or vim is refocused
" au FocusGained,BufEnter * :silent! !

" Reduce delay when pressing esc
set timeoutlen=1000 
set ttimeoutlen=0


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

" Use absolute line numbers by default
set norelativenumber

" " Use relative line numbers by default
" set relativenumber

" " Switch to absolute numbers in insert mode and relative line numbers elsewhere
" autocmd vimrc InsertEnter * :set norelativenumber
" autocmd vimrc InsertLeave * :set relativenumber

" Highlight current line
set cursorline

" Show position
set ruler

" Show bracket matches
set showmatch

" Tab completion Menu
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc

" Don't show the current mode (airline.vim takes care of us)

set noshowmode 

" Height of command bar
set cmdheight=1

" Always show status line
set laststatus=2

" Minimum padding of current line to top and bottom
set scrolloff=5

" Minimum padding of cursor to left and right border
set scrolloff=5

" Open new split panes to right and bottom
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Temporarily disable search highlighting until the next search
map <silent> <leader>/ :nohlsearch<cr>

" " Easier Navigation between splits | Alternative to vim-tmux-navigator
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Easier saving of current window
nnoremap <leader>w :w<cr>

" Easier closing of current window
nnoremap <leader>q :q<cr>

" Easier creation of splits
nnoremap <leader>sp :sp<cr>
nnoremap <leader>vsp :vsp<cr>

" Easier handling of buffers
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>ls :ls<cr>

" Easier handling of tabs
nnoremap <leader>t :tabs<CR>:tab<Space>

" Easier use of explore
nnoremap <leader>e :E<cr>

" Change working directory to the directory of the current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easier replacing
nnoremap <leader>\ :%s//gc<Left><Left><Left>
vnoremap <leader>\ :s//gc<Left><Left><Left>


"""""""""""""""""""""""""""""""""""""""""
" => Text, tab ind indent related
"""""""""""""""""""""""""""""""""""""""""

" Fix backspace
set backspace=indent,eol,start

" Linebreaking
set textwidth=200
set linebreak

" Use spaces instead of tabs
set expandtab

" Length of a single tab
set tabstop=8

" How many spaces are inserted when you press tab
set shiftwidth=4

" Behaviour depends on position
set smarttab

" Take indentation from previous line
set autoindent

" File-type basend indentation
if has('autocmd')
  filetype plugin indent on
endif


"""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""

" Enhanced incrementing of numbers, see http://vim.wikia.com/wiki/Making_a_list_of_numbers
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>


"""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Ignore 'ignorecase' if search pattern contains uppercase characters
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


"""""""""""""""""""""""""""""""""""""""""
" => Design
"""""""""""""""""""""""""""""""""""""""""

" Use 256 colors
set t_Co=256

" The colorscheme
colorscheme molokai

" Tell vim what the background color looks like
set background=dark

" Only highlight the current line number, not the line itself
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Make higlighted current line number bold
highlight CursorLineNr cterm=bold

" Change highlighting of matching brackets
hi MatchParen ctermfg=208  ctermbg=233 cterm=bold


"""""""""""""""""""""""""""""""""""""""""
" => Advanced
"""""""""""""""""""""""""""""""""""""""""

" Set compiler for haskell files
au BufEnter *.hs compiler ghc


"""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""

" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline' " Statusline
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' " Surround objects with tags,{,[,( etc. using ys, cs, ds etc.
Plug 'tpope/vim-fugitive' " Git Wrapper
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat' " Allow to use . for some other plugins
Plug 'tpope/vim-commentary' " Add comments with gc
Plug 'tpope/vim-unimpaired' " Mappings for complementary pairs of  commands
" Plug 'tpope/vim-eunuch'
Plug 'Shougo/vimproc.vim' "  Interactive command execution in Vim. Needed by ghcmod-vim
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
" Plug 'edkolev/promptline.vim' " Generate promt with airline colors
Plug 'edkolev/tmuxline.vim' " Use the vim-airline status line in tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim an tmux
Plug 'benmills/vimux' " Send commands from vim to tmux
Plug 'Valloric/YouCompleteMe' " Code-completion
Plug 'yonchu/accelerated-smooth-scroll' " Smooth scrolling for <C-D>/<C-U> and <C-F>/<C-B>
Plug 'Twinside/vim-hoogle' " Haskell Hoogle Search
Plug 'lukerandall/haskellmode-vim' " Haskell.
" Plug 'dag/vim2hs' " A collection of vimscripts for Haskell development
Plug 'bitc/vim-hdevtools' " Use Haskell hdevtools background server
Plug 'eagletmt/ghcmod-vim' " ghc-mod in vim
Plug 'eagletmt/neco-ghc' " A completion plugin for Haskell, using ghc-mod
Plug 'scrooloose/syntastic' " Syntax checking
" Plug 'majutsushi/tagbar' " Vim plugin that displays tags in a window, ordered by scope
call plug#end()


"""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""

" vim-airline """""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename


" vimux """""""""""""""""""""""""""""""""

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>


" syntastic """""""""""""""""""""""""""""""""
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_error_symbol = "✗"


" haskellmode-vim  """""""""""""""""""""""""""""""""
let g:haddock_browser="/usr/bin/firefox"


" neco-ghc  """""""""""""""""""""""""""""""""

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


" YouCompleteMe  """""""""""""""""""""""""""""""""

"  For neco-ghc needed?
let g:ycm_semantic_triggers = {'haskell' : ['.']}
