"" Line number
set number

"" Mouse
set mouse=a

"" Tabulation
set tabstop=4
set shiftwidth=4
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

syntax on
colorscheme desert
