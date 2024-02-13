if empty(glob(g:BASE_VIM.'/autoload/plug.vim'))
	silent execute '!curl -fLo '.g:BASE_VIM.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	exec "source ".BASE_VIM."/airline.vim"

	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	exec "source ".BASE_VIM."/devicons.vim"
	set updatetime=100
	Plug 'mhinz/vim-signify'
	Plug 'ctrlpvim/ctrlp.vim'
	exec "source ".BASE_VIM."/coc.vim"
call plug#end()
