local autosave = require('autosave')
autosave.setup {
	enabled = False,
	execution_message = function()
		return "💾 @ " .. vim.fn.strftime("%H:%M")
	end,
	events = { "InsertLeave", "TextChanged" },
	conditions = {
		exists = true,
		modifiable = true
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 135
}
