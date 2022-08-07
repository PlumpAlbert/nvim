local autosave = require('auto-save')
autosave.setup {
	enabled = false,
	execution_message = function()
		return "💾 @ " .. vim.fn.strftime("%H:%M")
	end,
	events = { "InsertLeave", "TextChanged", "TextChangedP", "TextChangedI" },
	conditions = {
		exists = true,
		modifiable = true
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 3000
}
