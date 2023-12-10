" MapKey to all mode
function	MapKey(key, act)
	exe 'nmap '.a:key.' '.a:act.'<CR>'
	exe 'vmap '.a:key.' <esc>'.a:act.'<CR>'
	exe 'imap '.a:key.' <esc>'.a:act.'<CR>a'
endfunction

" Trim leading space
function TrimLeadingSpace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfunction

" Trim before save
function Save()
	if !&modifiable
		return
	endif
	call TrimLeadingSpace()
	exe ':wa!'
endfunction

" Close tab
function CloseTab()
	if tabpagenr() == 1
		exe ":q!"
	else
		exe ":tabclose"
	endif
endfunction

let g:TermOpened = 'false'

" these lines are needed for ToggleComment()
" Reference: https://stackoverflow.com/a/24652257/2571881
autocmd FileType c,cpp,java      let b:comment_leader = '//'
autocmd FileType arduino         let b:comment_leader = '//'
autocmd FileType sh,ruby,python  let b:comment_leader = '#'
autocmd FileType zsh             let b:comment_leader = '#'
autocmd FileType conf,fstab      let b:comment_leader = '#'
autocmd FileType matlab,tex      let b:comment_leader = '%'
autocmd FileType vim             let b:comment_leader = '"'

function! ToggleComment()
    if exists('b:comment_leader')
        let l:pos = col('.')
        let l:space = ( &ft =~ '\v(c|cpp|java|arduino)' ? '3' : '2' )
        if getline('.') =~ '\v(\s*|\t*)' .b:comment_leader
            let l:space -= ( getline('.') =~ '\v.*\zs' . b:comment_leader . '(\s+|\t+)@!' ?  1 : 0 )
            execute 'silent s,\v^(\s*|\t*)\zs' .b:comment_leader.'[ ]?,,g'
            let l:pos -= l:space
        else
            exec 'normal! 0i' .b:comment_leader .' '
            let l:pos += l:space
        endif
        call cursor(line("."), l:pos)
    else
        echo 'no comment leader found for filetype'
    end
endfunction

