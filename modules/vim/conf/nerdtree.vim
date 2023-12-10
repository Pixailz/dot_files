" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter *
\ if &buftype != 'quickfix' && getcmdwintype() == ''
\ | silent NERDTreeMirror
\ | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter *
\ if tabpagenr('$') == 1 && winnr('$') == 1
\ && exists('b:NERDTree') && b:NERDTree.isTabTree()
\ | quit
\ | endif

" Display number of line in file
" let g:NERDTreeFileLines = 1

" let g:NERDTreeDirArrowExpandable=""
" let g:NERDTreeDirArrowCollapsible=""
" let g:NERDTreeDirArrowExpandable=""
" let g:NERDTreeDirArrowCollapsible=""
" let g:NERDTreeDirArrowExpandable=""
" let g:NERDTreeDirArrowCollapsible=""
let g:NERDTreeDirArrowExpandable=""
let g:NERDTreeDirArrowCollapsible=""
