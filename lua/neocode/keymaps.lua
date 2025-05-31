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
keymap({ 'n', 'v' }, '<leader>t', function()
	require('vscode').action('workbench.action.terminal.toggleTerminal')
end)
keymap({ 'n', 'v' }, '<leader>b', function()
	require('vscode').action('editor.debug.action.toggleBreakpoint')
end)
keymap({ 'n', 'v' }, '<leader>d', function()
	require('vscode').action('editor.action.showHover')
end)
keymap({ 'n', 'v' }, '<leader>a', function()
	require('vscode').action('editor.action.quickFix')
end)
keymap({ 'n', 'v' }, '<leader>sp', function()
	require('vscode').action('workbench.actions.view.problems')
end)
keymap({ 'n', 'v' }, '<leader>cn', function()
	require('vscode').action('notifications.clearAll')
end)
keymap({ 'n', 'v' }, '<leader>ff', function()
	require('vscode').action('workbench.action.quickOpen')
end)
keymap({ 'n', 'v' }, '<leader>cp', function()
	require('vscode').action('workbench.action.showCommands')
end)
keymap({ 'n', 'v' }, '<leader>pr', function()
	require('vscode').action('code-runner.run')
end)
keymap({ 'n', 'v' }, '<leader>lf', function()
	require('vscode').action('editor.action.formatDocument')
end)

-- folding
keymap({ 'n' }, 'zm', function()
	require('vscode').action('editor.foldAll')
end)
keymap({ 'n' }, 'zM', function()
	require('vscode').action('editor.foldAll')
end)
keymap({ 'n' }, 'zr', function()
	require('vscode').action('editor.unfoldAll')
end)
keymap({ 'n' }, 'zR', function()
	require('vscode').action('editor.unfoldAll')
end)

keymap({ 'n' }, 'zc', function()
	require('vscode').action('editor.fold')
end)
keymap({ 'n' }, 'zC', function()
	require('vscode').action('editor.foldRecursively')
end)
keymap({ 'n' }, 'zo', function()
	require('vscode').action('editor.unfold')
end)
keymap({ 'n' }, 'zO', function()
	require('vscode').action('editor.unfoldRecursively')
end)
keymap({ 'n' }, 'za', function()
	require('vscode').action('editor.toggleFold')
end)

keymap({ 'n' }, 'zk', function()
	require('vscode').action('editor.gotoPreviousFold')
end)
keymap({ 'n' }, 'zj', function()
	require('vscode').action('editor.gotoNextFold')
end)

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = false, silent = true })

-- harpoon keymaps
keymap({ 'n', 'v' }, '<leader>ha', function()
	require('vscode').action('vscode-harpoon.addEditor')
end)
keymap({ 'n', 'v' }, '<leader>ho', function()
	require('vscode').action('vscode-harpoon.editorQuickPick')
end)
keymap({ 'n', 'v' }, '<leader>he', function()
	require('vscode').action('vscode-harpoon.editEditors')
end)
keymap({ 'n', 'v' }, '<leader>h1', function()
	require('vscode').action('vscode-harpoon.gotoEditor1')
end)
keymap({ 'n', 'v' }, '<leader>h2', function()
	require('vscode').action('vscode-harpoon.gotoEditor2')
end)
keymap({ 'n', 'v' }, '<leader>h3', function()
	require('vscode').action('vscode-harpoon.gotoEditor3')
end)
keymap({ 'n', 'v' }, '<leader>h4', function()
	require('vscode').action('vscode-harpoon.gotoEditor4')
end)
keymap({ 'n', 'v' }, '<leader>h5', function()
	require('vscode').action('vscode-harpoon.gotoEditor5')
end)
keymap({ 'n', 'v' }, '<leader>h6', function()
	require('vscode').action('vscode-harpoon.gotoEditor6')
end)
keymap({ 'n', 'v' }, '<leader>h7', function()
	require('vscode').action('vscode-harpoon.gotoEditor7')
end)
keymap({ 'n', 'v' }, '<leader>h8', function()
	require('vscode').action('vscode-harpoon.gotoEditor8')
end)
keymap({ 'n', 'v' }, '<leader>h9', function()
	require('vscode').action('vscode-harpoon.gotoEditor9')
end)

-- project manager keymaps
keymap({ 'n', 'v' }, '<leader>pa', function()
	require('vscode').action('projectManager.saveProject')
end)
keymap({ 'n', 'v' }, '<leader>po', function()
	require('vscode').action('projectManager.listProjectsNewWindow')
end)
keymap({ 'n', 'v' }, '<leader>pe', function()
	require('vscode').action('projectManager.editProjects')
end)
--#endregion
