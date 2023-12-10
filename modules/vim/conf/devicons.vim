" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
" let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" disable showing the distribution for unix file encoding (enabled by default with 1)
" let g:DevIconsEnableDistro = 0

" enable custom folder/directory glyph exact matching
" (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
" let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

" change the default folder/directory glyph/icon
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = 'ƛ'

" change the default open folder/directory glyph/icon (default is '')
" let g:DevIconsDefaultFolderOpenSymbol = 'ƛ'

" " change the default dictionary mappings for file extension matches
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'ƛ'

" " change the default dictionary mappings for exact file node matches
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['MyReallyCoolFile.okay'] = 'ƛ'

" " add or override individual additional filetypes
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'ƛ'

" " add or override pattern matches for filetypes
" " these take precedence over the file extensions
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*jquery.*\.js$'] = 'ƛ'

Plug 'ryanoasis/vim-devicons'
