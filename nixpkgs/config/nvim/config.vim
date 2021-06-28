" ***** Basic Setings *****

" Special Characters
"set listchars=tab:▸\ ,eol:¬
"set list                               "Enable above line

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

" Other Settings
"set backupdir=~/.vim/backups            "Set the directory for backup files
"set directory=~/.vim/swaps              "Set the directory for swap files
"if exists("&undodir")
"    set undodir=~/.vim/undo             "Set the directory for undo files
"endif

" ***** End Basic Settings *****

" ***** File Type Specifc Settings *****


" ***** Gvim Specific Settings *****

"if has("gui_running")
"    set guitablabel=\[%N\]\ %t\ %M
"    set guioptions-=T                   "Remove toolbar
"    set guioptions-=r                   "Remove right-hand scrollbar
"    set guioptions-=L                   "Never have a left-hand scrollbar
"    set guioptions+=a                   "Try to use the system clipboard for copy/paste
"    set guioptions+=m                   "Keep the menu bar
"
"    set columns=130                     "Set the window width
"    set lines=64                        "Set the window height
"endif


" ***** End Gvim Specific Settings *****


" ***** Plugin Settings *****

""""""""""""""""""
"" coc-snippets
""""""""""""""""""

"let g:coc_snippet_next = '<leader>sn'             " jump to the next placeholder
"let g:coc_snippet_prev = '<leader>se'             " jump to the previous placeholder


"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

" ***** End Plugin Settings *****
