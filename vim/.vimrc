" Config

"" Line number
set number
set relativenumber

"" Mouse
set mouse=a

"" Tabulation
set tabstop=4
set smartindent autoindent

"" Show all character
set list
set listchars=tab:>-
set listchars+=space:_

"" Cursor
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Function

"" MapKey to all mode
function	MapKey(key, act)
	exe 'nmap '.a:key.' '.a:act.'<CR>'
	exe 'vmap '.a:key.' <esc>'.a:act.'<CR>'
	exe 'imap '.a:key.' <esc>'.a:act.'<CR>a'
endfunction

" KeyMap

"" New Tab
call MapKey('<C-t>', ':tabnew')

"" Save
call MapKey('<C-s>', ':wa!')

"" Save and quit
call MapKey('<C-q>', ':xa!')

" Usefull shortcut
""
