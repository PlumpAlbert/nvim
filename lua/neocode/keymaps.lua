local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- #region basic keys
-- remap leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- copy/paste functionality
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- indentation
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- move text
keymap('v', 'J', ':m .+1<CR>==', opts)
keymap('v', 'K', ':m .-2<CR>==', opts)
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- preserve clipboard on paste
keymap('v', 'p', '"_dP', opts)

keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)
--#endregion

--#region vscode
-- general keymaps
keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ 'n', 'v' }, '<leader>d', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ 'n', 'v' }, '<leader>a', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ 'n', 'v' }, '<leader>sp', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ 'n', 'v' }, '<leader>ff', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ 'n', 'v' }, '<leader>pr', "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ 'n', 'v' }, '<leader>lf', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- folding
keymap({ 'n' }, 'zm', "<cmd>lua require('vscode').action('editor.foldAll')<CR>")
keymap({ 'n' }, 'zM', "<cmd>lua require('vscode').action('editor.foldAll')<CR>")
keymap({ 'n' }, 'zr', "<cmd>lua require('vscode').action('editor.unfoldAll')<CR>")
keymap({ 'n' }, 'zR', "<cmd>lua require('vscode').action('editor.unfoldAll')<CR>")

keymap({ 'n' }, 'zc', "<cmd>lua require('vscode').action('editor.fold')<CR>")
keymap({ 'n' }, 'zC', "<cmd>lua require('vscode').action('editor.foldRecursively')<CR>")
keymap({ 'n' }, 'zo', "<cmd>lua require('vscode').action('editor.unfold')<CR>")
keymap({ 'n' }, 'zO', "<cmd>lua require('vscode').action('editor.unfoldRecursively')<CR>")
keymap({ 'n' }, 'za', "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = false, silent = true })

-- harpoon keymaps
keymap({ 'n', 'v' }, '<leader>ha', "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({ 'n', 'v' }, '<leader>ho', "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({ 'n', 'v' }, '<leader>he', "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({ 'n', 'v' }, '<leader>h1', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({ 'n', 'v' }, '<leader>h2', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({ 'n', 'v' }, '<leader>h3', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({ 'n', 'v' }, '<leader>h4', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({ 'n', 'v' }, '<leader>h5', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({ 'n', 'v' }, '<leader>h6', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({ 'n', 'v' }, '<leader>h7', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({ 'n', 'v' }, '<leader>h8', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({ 'n', 'v' }, '<leader>h9', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({ 'n', 'v' }, '<leader>pa', "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({ 'n', 'v' }, '<leader>po', "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({ 'n', 'v' }, '<leader>pe', "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
--#endregion
