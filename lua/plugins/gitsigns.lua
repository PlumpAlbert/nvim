-- vim:ft=lua:ts=2:sw=0
local gs = require('gitsigns')
gs.setup {
	signs = {
		add = {hl = 'GitSignsAdd', text = '│', numhl='GitSignsAddNr' , linehl='GitSignsAddLn'},
		change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
	signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm = {
		enable = false
	},
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or { silent = true }
			opts.buffer = true
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
		map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

		-- Staging
		map({'n','v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
		map({'n','v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
		map('n', '<leader>hS', gs.stage_buffer)
		map('n', '<leader>hR', gs.reset_buffer)
		map('n', '<leader>hu', gs.undo_stage_hunk)
		map('n', '<leader>hp', gs.preview_hunk)
		map('n', '<leader>hd', gs.diffthis)
		map('n', '<leader>td', gs.toggle_deleted)
	end
}
