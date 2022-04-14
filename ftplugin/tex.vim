" vim:ft=vim:ts=4:sw=0
filetype plugin indent on
setlocal textwidth=80
setlocal wrapmargin=0
setlocal formatoptions+=t
setlocal linebreak
setlocal spell

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'zathura-xrdb'
let g:vimtex_view_general_options = '@pdf'
let maplocalleader = ','

" configure latexmk
let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 1,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-auxdir=./aux',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}

" mappings
call vimtex#imaps#add_map({
			\ 'lhs' : '<m-i>',
			\ 'rhs' : '\item ',
			\ 'leader' : '',
			\ 'wrapper' : 'vimtex#imaps#wrap_environment',
			\ 'context' : ['itemize', 'enumerate'],
			\})
