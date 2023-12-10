let g:coc_global_extensions = [
\	'coc-json', 
\	'coc-git',
\	'@yaegassy/coc-ansible',
\	'coc-docker',
\	'coc-go',
\	'coc-highlight',
\	'coc-lua',
\	'coc-highlight',
\	'coc-markdownlint',
\	'coc-markdown-preview-enhanced',
\	'coc-python',
\	'coc-sh',
\	'coc-sql',
\	'coc-vimlsp',
\	'coc-xml',
\	'coc-yaml'
\]

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

