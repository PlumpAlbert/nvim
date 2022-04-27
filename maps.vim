" Save file
inoremap <silent> <C-s> <cmd>w<CR>
inoremap <silent> <C-ы> <cmd>w<CR>
nnoremap <silent> <C-s> <cmd>w<CR>
nnoremap <silent> <C-ы> <cmd>w<CR>
xnoremap <silent> <C-s> <cmd>w<CR>
xnoremap <silent> <C-ы> <cmd>w<CR>
" Keep VisualMode after indent with > or <
vmap < <gv
vmap > >gv
" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move up and down in wrapped lines
nnoremap <silent> j gj
nnoremap <silent> о gj
nnoremap <silent> k gk
nnoremap <silent> л gk
" Scroll up and down
nnoremap <silent> <c-j> <c-e>
nnoremap <silent> <c-о> <c-e>
inoremap <silent> <c-j> <c-e>
inoremap <silent> <c-о> <c-e>
nnoremap <silent> <c-k> <c-y>
nnoremap <silent> <c-л> <c-y>
inoremap <silent> <C-k> <C-y>
inoremap <silent> <C-л> <C-y>

" nvim-tree
nnoremap <silent> <C-n> <cmd>NvimTreeToggle<CR>

" telescope
nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>аи <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>ff <cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>
nnoremap <silent> <leader>аа <cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>
nnoremap <silent> <leader>gl <cmd>Telescope git_commits<CR>
nnoremap <silent> <leader>пд <cmd>Telescope git_commits<CR>
nnoremap <silent> <leader>gs <cmd>Telescope git_status<CR>
nnoremap <silent> <leader>пы <cmd>Telescope git_status<CR>
nnoremap <silent> <leader>fw <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>ац <cmd>Telescope live_grep<CR>

" comment
nnoremap <silent> <leader><Space> :lua require('Comment.api').toggle_current_linewise()<CR>
xnoremap <silent> <leader><Space> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>

" buffer resize
nnoremap <silent> <M-h> <C-w>>
nnoremap <silent> <M-j> <C-w>+
nnoremap <silent> <M-k> <C-w>-
nnoremap <silent> <M-l> <C-w><

" move around tabs
inoremap <silent> <C-h> <cmd>tabprevious<CR>
nnoremap <silent> <C-h> <cmd>tabprevious<CR>
xnoremap <silent> <C-h> <cmd>tabprevious<CR>

inoremap <silent> <C-l> <cmd>tabnext<CR>
nnoremap <silent> <C-l> <cmd>tabnext<CR>
xnoremap <silent> <C-l> <cmd>tabnext<CR>

" Git
nnoremap <silent> <leader>cm <cmd>Git commit<CR>
nnoremap <silent> <leader>сь <cmd>Git commit<CR>
