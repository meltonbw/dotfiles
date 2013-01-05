" ***** Basic Setings *****

" Make VIM incompatible with VI
set nocompatible						"Not compatibility support with Vi
set modelines=0							"Number of lines to look for vim commands

" Reload vimrc on write
autocmd bufwritepost .vimrc source ~/.vimrc

" Setup Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

" Color Settings
syntax enable
set background=dark
colo solarized

" Tab Settings
set tabstop=4
set shiftwidth=4

" Special Characters
set listchars=tab:▸\ ,eol:¬
set list								"Enable above line

" Cursor Settings
set guicursor+=a:blinkon0				"Turn off cursor blinking
set cursorline							"Enable current cursor line highlight
set ruler								"Enable position indicator in lower right corner
set backspace=indent,start				"Configure allowed backspace behavior
set laststatus=2						"Enable status bar at the bottom of the screen
set matchtime=3							"1/10 second delay before showing matching braces
set mouse=a								"Enable mouse

" Line Numbers
set number								"Enable line numbering
set norelativenumber					"Numbers are not relative to syntax

" Set Default Shell
set shell=/bin/bash						"Default shell to use for external commands

" Search Settings
set ignorecase							"Case-insensitive searching
set smartcase							"Only case sensitive when search has upper case characters
set gdefault							"The 'g' flag is set by default for substitute commands
set incsearch							"Dynamically update search highlighting as query is typed
set hlsearch							"Highlight all the matches of previous searches

" Movement Settings
set showmatch							"When a bracket is inserted, temporarily move to the matching brace

" Enable Code Completion
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Key Remapping For Colemak (NOTE: QUERTY users may want to remove this)
noremap f e
noremap F E
noremap p r
noremap P R
noremap g t
noremap G T
noremap j y
noremap J Y
noremap l u
noremap L U
noremap u i
noremap U I
noremap y o
noremap Y O
noremap ; p
noremap : P
noremap r s
noremap R S
noremap s d
noremap S D
noremap t f
noremap T F
noremap d g
noremap D G
noremap n j
noremap N J
noremap e k
noremap E K
noremap i l
noremap I L
noremap o ;
noremap O :
noremap k n
noremap K N

" Remap Cursor Movement Keys to jkli and insert mode to h
noremap i l
noremap e j
noremap n h
noremap u k
noremap h i

" Set Leader Character
let mapleader = ","

" Other Settings
set encoding=utf-8						"Text encoding
set scrolloff=5							"Show a number of lines when scrolling for context
set autoindent							"Use auto indentation
set showmode							"Show the current editor mode
set showcmd								"Show last command
set ttyfast								"Send more characters on redraw
set lazyredraw							"Do not redraw screen when running macros
set hidden								"Allow switching unsaved buffers
set wildmenu							"Special command autocompletion
set wildmode=list:longest				"The mode for autocompletion
set visualbell							"Turn on visual feedback
set dictionary=/usr/share/dict/words	"Set location of dictionary
set pastetoggle=<F12>					"Set paste operation shortcut
set backupdir=~/.vim/backups			"Set the directory for backup files
set directory=~/.vim/swaps				"Set the directory for swap files
if exists("&undodir")
	set undodir=~/.vim/undo				"Set the directory for undo files
endif
noremap <F1> <ESC>						"Get rid of the damn help key
noremap! <F1> <ESC>						"...in all modes



" ***** End Basic Settings *****


" ***** Gvim Specific Settings *****

if has("gui_running")
	set guifont=GohuFont
	set guitablabel=%-0.12t%M
	set guioptions-=T					"Remove toolbar
	set guioptions-=r					"Remove right-hand scrollbar
	set guioptions-=L					"Never have a left-hand scrollbar
	set guioptions+=a					"Try to use the system clipboard for copy/paste
	set guioptions+=m					"Keep the menu bar
	syntax enable
	set background=dark
	colo solarized
endif

autocmd bufwritepost .vimrc source ~/.vimrc

" ***** End Gvim Specific Settings *****


" ***** Plugin Settings *****

" NERDTree Settings
nnoremap <F2> :NERDTreeToggle<CR>		"Toggle the NERDTree plugin

" Tagbar Settings
nnoremap <F3> :TagbarToggle<CR>			"Toggle the Tagbar plugin

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ***** End Plugin Settings *****
