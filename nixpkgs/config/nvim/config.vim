" ***** Basic Setings *****

" Make VIM incompatible with VI
set nocompatible                        "Not compatibility support with Vi
set modelines=0                         "Number of lines to look for vim commands

" Reload vimrc on write
autocmd bufwritepost ~/dotfiles/nixpkgs/config/nvim/config.vim source ~/dotfiles/nixpkgs/config/nvim/config.vim

syntax on
set termguicolors
filetype plugin indent on

" Color Settings
syntax enable

" Tab Settings
set smarttab                            "Insert tabstop number of spaces
set expandtab                           "Convert tabs to spaces
set tabstop=4                           "Indent using four spaces
set shiftround                          "When shifting lines, round the indentation to the nearest multiple of shiftwidth
set shiftwidth=4                        "When shifting, indent using four spaces
set softtabstop=4                       "Don't use softtabstop

" Special Characters
"set listchars=tab:▸\ ,eol:¬
"set list                               "Enable above line

" Cursor Settings
set guicursor+=a:blinkon0               "Turn off cursor blinking
set cursorline                          "Enable current cursor line highlight
set ruler                               "Enable position indicator in lower right corner
set backspace=indent,eol,start          "Configure allowed backspace behavior
set laststatus=2                        "Enable status bar at the bottom of the screen
set matchtime=3                         "1/10 second delay before showing matching braces
set mouse=a                             "Enable mouse

" Line Numbers
set number                              "Enable line numbering
set norelativenumber                    "Numbers are not relative to syntax

" Set Default Shell
set shell=/bin/bash                     "Default shell to use for external commands

" Search Settings
set ignorecase                          "Case-insensitive searching
set smartcase                           "Only case sensitive when search has upper case characters
set gdefault                            "The 'g' flag is set by default for substitute commands
set incsearch                           "Dynamically update search highlighting as query is typed
set hlsearch                            "Highlight all the matches of previous searches

" Movement Settings
set showmatch                           "When a bracket is inserted, temporarily move to the matching brace

" Enable Code Completion
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Remap Cursor Movement Keys to jkli (QUERTY), and due to Colemak conflicts, i (insert mode) to h,
" n (find next) to k, u (undo) to l,
"
"noremap i h
"noremap l i
"noremap h n
"noremap n k
"noremap k u
"noremap u l
"noremap j e

" Set Leader Character
let mapleader = ","

" Other Settings
set updatetime=100                      "Set vim update time to 100ms
set encoding=utf-8                      "Text encoding
set linebreak                           "Avoid wrapping a line in the middle of a word
set scrolloff=5                         "Show a number of lines when scrolling for context
set autoindent                          "Use auto indentation
set noshowmode                          "Do not show the editor mode (lightline does it now)
set showcmd                             "Show last command
set ttyfast                             "Send more characters on redraw
set lazyredraw                          "Do not redraw screen when running macros
set hidden                              "Allow switching unsaved buffers
set wildmenu                            "Special command autocompletion
set wildmode=list:longest               "The mode for autocompletion
set visualbell                          "Turn on visual feedback
set dictionary=/usr/share/dict/words    "Set location of dictionary
set pastetoggle=<F12>                   "Set paste operation shortcut
"set backupdir=~/.vim/backups            "Set the directory for backup files
"set directory=~/.vim/swaps              "Set the directory for swap files
"if exists("&undodir")
"    set undodir=~/.vim/undo             "Set the directory for undo files
"endif
noremap <F1> <ESC>                      "Get rid of the damn help key
noremap! <F1> <ESC>                     "...in all modes

" ***** End Basic Settings *****

" ***** File Type Specifc Settings *****
autocmd FileType verilog_systemverilog setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

augroup filetypedetect
  autocmd!
  autocmd BufNewFile,BufRead *.f setfiletype filelist
augroup END


" ***** Gvim Specific Settings *****

if has("gui_running")
    set guitablabel=\[%N\]\ %t\ %M
    set guioptions-=T                   "Remove toolbar
    set guioptions-=r                   "Remove right-hand scrollbar
    set guioptions-=L                   "Never have a left-hand scrollbar
    set guioptions+=a                   "Try to use the system clipboard for copy/paste
    set guioptions+=m                   "Keep the menu bar
    syntax enable                       "Enable syntax highlighting
    set background=dark
    colorscheme solarized8

    set columns=130                     "Set the window width
    set lines=64                        "Set the window height

    " Indent Guides
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 5
endif

if !has('gui_running')
    syntax enable                       "Enable syntax highlighting
    set background=dark
    colorscheme solarized8

    " Indent Guides
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 5
endif

" ***** End Gvim Specific Settings *****


" ***** Plugin Settings *****

" NERDTree Settings
"nnoremap <F2> :NERDTreeToggle<CR>        "Toggle the NERDTree plugin

" Tagbar Settings
"nnoremap <F3> :TagbarToggle<CR>            "Toggle the Tagbar plugin

" MiniBufExplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
\ }

" GitGutter
" none

" deoplete
let g:deoplete#enable_at_startup = 1

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_disable = 1          " disable automatic indentation

" haskellFold
"let g:haskellFold_ShortText = 1

" hindent
let g:hindent_line_length = 120

" neco-ghc
let g:necoghc_use_stack = 1
let g:necoghc_enable_detailed_browse = 1

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" ***** End Plugin Settings *****
