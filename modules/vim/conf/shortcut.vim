"# Tab
call MapKey('<C-t>t', ':tabnew')
call MapKey('<C-t>w', ':tabclose')
call MapKey('<C-t>n', ':tabnext')
call MapKey('<C-t>p', ':tabprevious')

" Save
call MapKey('<C-s>', ':call Save()')

" Save and quit
call MapKey('<C-q>', ':call CloseTab()')

" Buffer
call MapKey('<S-m>w', ':call Save()<CR>:bdelete')
call MapKey('<S-m>n', ':bnext!')
call MapKey('<S-m>p', ':bprevious!')

" Comment line of code
call MapKey('<C-_>', ':call ToggleComment()')

" open term
call MapKey('<C-k>', ':below term')
