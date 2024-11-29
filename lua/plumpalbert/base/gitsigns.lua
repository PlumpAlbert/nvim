return {
	'lewis6991/gitsigns.nvim',
	event = {"BufEnter"},
	config = true,
	opts = {
		signcolumn = false,
		numhl = true,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'right_align',
			delay = 300,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter= '👨 <author> 🗒️ <summary>',
		sign_priority = 6,
		update_debounce = 100,
		preview_config = {
			border = 'single',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1,
		}
	},
	keys = {
		{ '<leader>gp', function()
			require('gitsigns').preview_hunk()
		end, desc = 'Preview hunk' },
		{ '<leader>grh', function()
			require('gitsigns').reset_hunk()
		end, desc = 'Reset hunk' },
		{ '<leader>grb', function()
			require('gitsigns').reset_buffer()
		end, desc = 'Reset buffer' },
		{ '<leader>gb', function()
			require('gitsigns').toggle_current_line_blame()
		end, desc = 'Toggle line blame' },
	}
}
