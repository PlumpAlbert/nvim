" Open vim with dir
autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif

" Do not show line numbers inside terminals
autocmd TermOpen term://* setlocal nonumber norelativenumber
	\ setfiletype terminal
	\ setlocal nospell

" Use relative & absolute line numbers in 'n' & 'i' modes respectively
autocmd InsertEnter * set number norelativenumber
autocmd InsertLeave * set number relativenumber
