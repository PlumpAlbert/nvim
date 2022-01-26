" Move up and down in wrapped lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" nvim-tree
nnoremap <silent> <C-n> <cmd>NvimTreeToggle<CR>

" telescope
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>ff <cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>
nnoremap <silent> <leader>gl <cmd>Telescope git_commits<CR>
nnoremap <silent> <leader>gs <cmd>Telescope git_status<CR>
nnoremap <silent> <leader>fw <cmd>Telescope live_grep<CR>

" comment
nnoremap <silent> <leader>c :lua require('Comment.api').toggle_current_linewise()<CR>
vnoremap <silent> <leader>c :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>

" buffer resize
nnoremap <silent> <C-h> <C-w>>
nnoremap <silent> <C-j> <C-w>+
nnoremap <silent> <C-k> <C-w>-
nnoremap <silent> <C-l> <C-w><
