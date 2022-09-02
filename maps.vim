" Save file
inoremap <silent> <C-s> <cmd>w<CR>
inoremap <silent> <C-ы> <cmd>w<CR>
nnoremap <silent> <C-s> <cmd>w<CR>
nnoremap <silent> <C-ы> <cmd>w<CR>
xnoremap <silent> <C-s> <cmd>w<CR>
xnoremap <silent> <C-ы> <cmd>w<CR>
" swap buffers
nnoremap <silent> <A-.> <cmd>BufferNext<CR>
nnoremap <silent> <A-,> <cmd>BufferPrevious<CR>
nnoremap <silent> <A-б> <cmd>BufferNext<CR>
nnoremap <silent> <A-ю> <cmd>BufferPrevious<CR>
" move buffers around
nnoremap <silent> <A-<> <cmd>BufferMovePrevious<CR>
nnoremap <silent> <A->> <cmd>BufferMoveNext<CR>
nnoremap <silent> <A-Ю> <cmd>BufferMovePrevious<CR>
nnoremap <silent> <A-Б> <cmd>BufferMoveNext<CR>
" close buffer
nnoremap <silent> <leader>q <cmd>BufferClose<CR>
nnoremap <silent> <A-q> <cmd>BufferClose<CR>
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

" nvim-tree
nnoremap <silent> <leader>e <cmd>NvimTreeToggle<CR>

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
nnoremap <silent> <leader>ls <cmd>Telescope projects<CR>
nnoremap <silent> <leader>ды <cmd>Telescope projects<CR>

" buffer resize
nnoremap <silent> <M-h> <C-w>>
nnoremap <silent> <M-j> <C-w>+
nnoremap <silent> <M-k> <C-w>-
nnoremap <silent> <M-l> <C-w><

" Git
nnoremap <silent> <leader>hp <cmd>Gitsigns preview_hunk<CR>

" Code screenshots
nnoremap <silent> <leader>cp <cmd>Rayso<CR> 
