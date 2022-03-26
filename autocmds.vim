" Open vim with dir
" autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif

" Do not check spelling inside terminal
autocmd BufEnter *.{md,tex,txt} setlocal spell wrap

" Use relative & absolute line numbers in 'n' & 'i' modes respectively
autocmd InsertEnter * set number norelativenumber
autocmd InsertLeave * set number relativenumber
