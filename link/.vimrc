" vim: foldmethod=marker

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Compatibility                                                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't need to be compatible with old vim
set nocompatible

" Apply sensible.vim first, allows overriding
runtime! plugin/sensible.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General                                                                {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set default encoding
set encoding=utf8

" Set default spell checking language
set spelllang=en,de

" Enable syntax highlighting
syntax on

" Sets how many lines of history VIM has to remember
set history=1000

" Set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

" Use normal system clipboard (Ctrl-C, Ctrl-V)
" set clipboard=unnamedplus

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

" Reduce delay when pressing <esc>
set timeoutlen=1000
set ttimeoutlen=0

" Configure persistent undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files                                                                  {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Local dirs
if !has('win32')
  set backupdir=$DOTFILES/caches/vim
  set directory=$DOTFILES/caches/vim
  set undodir=$DOTFILES/caches/vim
  let g:netrw_home = expand('$DOTFILES/caches/vim')
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface                                                     {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

" Use absolute line numbers by default
set norelativenumber

" Use relative line numbers by default
" set relativenumber

" Switch to absolute numbers in insert mode and relative line numbers elsewhere
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
set cmdheight=2

" Always show status line
set laststatus=2

" Minimum padding of current line to top and bottom
set scrolloff=5

" Minimum padding of cursor to left and right border
set scrolloff=5

" Open new split panes to right and bottom
set splitbelow
set splitright

" How to display diffs
set diffopt+=vertical

if has('gui_running')
    set guifont=Hack
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings                                                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Sensible usage of Y
noremap Y y$

" Keep visual selection for easier indenting
vnoremap < <gv
vnoremap > >gv

" Temporarily disable search highlighting until the next search
map <silent> <leader>/ :nohlsearch<cr>

" Easier Navigation between splits | Alternative to vim-tmux-navigator
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Easier saving of current window
" nnoremap <leader>w :w<cr>

" Easier closing of current window
" nnoremap <leader>q :q<cr>

" Easier creation of splits
" nnoremap <leader>sp :split<cr>
" nnoremap <leader>vsp :vsplit<cr>

" Easier handling of buffers
" nnoremap <leader>b :ls<CR>:b<Space>
" nnoremap <leader>ls :ls<cr>

" Easier handling of tabs
" nnoremap <leader>t :tabs<CR>:tab<Space>

" Easier use of explore
" nnoremap <leader>e :Explore<cr>

" Change working directory to the directory of the current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easier replacing
nnoremap <leader>\ :%s//gc<Left><Left><Left>
vnoremap <leader>\ :s/\%V/gc<Left><Left><Left>

" Toggle spell checking
nnoremap <silent> <leader>s :set spell!<CR>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab ind indent related                                           {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix backspace
set backspace=indent,eol,start

" Line breaking
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

" File-type based indentation
if has('autocmd')
  filetype plugin indent on
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions                                                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search                                                                 {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Ignore 'ignorecase' if search pattern contains uppercase characters
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Design                                                                 {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use 256 colors
set t_Co=256

" The color scheme
colorscheme molokai

" Tell vim what the background color looks like
set background=dark

" How to display invisible character when 'list' is set
set listchars=tab:▸\ ,eol:¬

" Modify the colorscheme
function! ModifyColorScheme()
    " Only highlight the current line number, not the line itself
    highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

    " Make highlighted current line number bold
    highlight CursorLineNr cterm=bold

    " Change highlighting of matching brackets
    highlight MatchParen ctermfg=208  ctermbg=233 cterm=bold
endfunction

" Apply changes when .vimrc is read
call ModifyColorScheme()

" Apply changes after vim startup
autocmd vimrc VimEnter * call ModifyColorScheme()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Haskell                                                                {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set compiler for haskell files
autocmd vimrc BufEnter *.hs compiler ghc

" Use stylish haskell instead of par for haskell buffers
autocmd vimrc FileType haskell let &formatprg="stylish-haskell"

" Call stylish-haskell
" command! Stylish :%!stylish-haskell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins                                                                {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')

" Elementary features """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'              " Defaults everyone can agree on
Plug 'tpope/vim-eunuch'                " Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-surround'              " Surround objects with tags,{,[,( etc. using ys, cs, ds etc.
Plug 'tpope/vim-repeat'                " Allows to use . for some other plugins
Plug 'tpope/vim-unimpaired'            " Mappings for complementary pairs of  commands
Plug 'tpope/vim-commentary'            " Add comments with gc
Plug 'tpope/vim-vinegar'               " Enhances the netrw file browser
Plug 'michaeljsmith/vim-indent-object' " defines a text object representing code at the same indent level

" UI """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'            " Statusline
Plug 'vim-airline/vim-airline-themes'     " Statusline themes
Plug 'yonchu/accelerated-smooth-scroll'   " Smooth scrolling for <C-D>/<C-U> and <C-F>/<C-B>
Plug 'mbbill/undotree'                    " Visualize vim's undo tree
Plug 'moll/vim-bbye'                      " Delete buffers without closing windows
Plug 'scrooloose/nerdtree'                " A tree explorer plugin for vim
Plug 'Xuyuanp/nerdtree-git-plugin'        " A plugin of NERDTree showing git status
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder
" Plug 'edkolev/promptline.vim'           " Generate promt with airline colors
" Plug 'easymotion/vim-easymotion'        " Vim motions on speed!
" Plug 'majutsushi/tagbar'                " Vim plugin that displays tags in a window, ordered by scope
" Plug 'Yggdroot/indentLine'              " Display the indention levels with thin vertical lines
" Plug 'nathanaelkane/vim-indent-guides'  " visually displaying indent levels in code
" Plug 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim

" Tmux """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'edkolev/tmuxline.vim'           " Use the vim-airline status line in tmux
Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between vim an tmux
Plug 'benmills/vimux'                 " Send commands from vim to tmux
Plug 'jpalardy/vim-slime'             " Send text to an REPL using tmux

" Text manipulation """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ntpeters/vim-better-whitespace'  " Show and remove trailing whitespace
Plug 'godlygeek/tabular'               " Align text
Plug 'sirver/ultisnips'                " The ultimate snippet solution for Vim
" Plug 'ervandew/supertab'               " Perform all your vim insert mode completions with Tab
Plug 'honza/vim-snippets'              " Snippets
Plug 'nelstrom/vim-visual-star-search' " Start a * or # search from a visual block
Plug 'tpope/vim-abolish'               " easily search, substitute, abbreviate multiple variants of a word
Plug 'tommcdo/vim-exchange'            " Easy text exchange operator for Vim: cx
Plug 'dkprice/vim-easygrep'            " Fast and Easy Find and Replace Across Multiple Files

" Git """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'       " Git Wrapper
Plug 'int3/vim-extradite'       " A git commit browser for vim. Extends fugitive
" Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter and stages/reverts hunks

" Programming """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'Valloric/YouCompleteMe', {'do': './install.py'} " Code-completion
" Plug 'scrooloose/syntastic'                           " Syntax checking
" Plug 'tpope/vim-dispatch'                             " asynchronous build and test dispatcher
Plug 'JuliaLang/julia-vim'                              " Vim support for Julia

" Haskell """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Twinside/vim-hoogle',         {'for': 'haskell'}                " Haskell Hoogle Search
Plug 'lukerandall/haskellmode-vim', {'for': 'haskell'}                " Haskell.
Plug 'dag/vim2hs',                  {'for': 'haskell'}                " A collection of vimscripts for Haskell development
Plug 'bitc/vim-hdevtools',          {'for': 'haskell'}                " Use Haskell hdevtools background server
Plug 'eagletmt/ghcmod-vim',         {'for': 'haskell'}                " ghc-mod in vim
Plug 'Shougo/vimproc.vim',          {'for': 'haskell', 'do': 'make'}  " Interactive command execution in Vim. Needed by ghcmod-vim
Plug 'eagletmt/neco-ghc',           {'for': 'haskell'}                " A completion plugin for Haskell, using ghc-mod
Plug 'neovimhaskell/haskell-vim',   {'for': 'haskell'}                " Syntax Highlighting and Indentation for Haskell and Cabal

" Java """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'klen/python-mode', {'for': 'python'} " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box

" Latex """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lervag/vimtex'               " A modern vim plugin for editing LaTeX files

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings                                                        {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
source ~/.vim/term_breeze.vim " TODO: Clean this up
let g:airline_theme='term_breeze'

" vimux """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


" vim-fugitive """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Greview :split | :Git! diff --staged


" syntastic """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_error_symbol = "✗"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" haskellmode-vim """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haddock_browser="/usr/bin/firefox"


" neco-ghc """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


" Supertab """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The same as used by YCM
" let g:SuperTabDefaultCompletionType = '<C-n>'

" YouCompleteMe """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"  For neco-ghc needed?
let g:ycm_semantic_triggers = {'haskell' : ['.']}


" ultisnip """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<c-space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" indentLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┊'


" vim-better-whitespace """"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlighting in current line in insertmode
autocmd vimrc InsertEnter * :silent! CurrentLineWhitespaceOff hard
autocmd vimrc InsertLeave * :silent! CurrentLineWhitespaceOn


" vim-slime """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.2"}
let g:slime_dont_ask_default = 1
let g:slime_no_mappings = 0


" vim2hs """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_multiline_strings = 0


" tabular """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Needs to be loaded after tabular
function! LoadTabularPatterns()
    AddTabularPattern! css_colon /:\zs/l0c1l1
    " AddTabularPattern! plug /{\|"
endfunction

" Call function after startup
autocmd vimrc VimEnter * call LoadTabularPatterns()


" undotree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" NERDtree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle sidebar
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

" Closes vim if NERDTree ist the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ctrl-P """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>f'
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
