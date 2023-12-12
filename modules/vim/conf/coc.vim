let g:coc_global_extensions = [
\	'@yaegassy/coc-ansible',
\	'coc-docker',
\	'coc-git',
\	'coc-go',
\	'coc-sh',
\	'coc-highlight',
\	'coc-json',
\	'coc-lua',
\	'coc-markdownlint',
\	'coc-python',
\	'coc-pyright',
\	'coc-sql',
\	'coc-tsserver',
\	'coc-vimlsp',
\	'coc-xml',
\	'coc-yaml',
\]

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
