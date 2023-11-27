return {
	"dmmulroy/tsc.nvim",
	ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	opts = {
		auto_open_qflist = true,
		auto_close_qflist = false,
		auto_focus_qflist = false,
		auto_start_watch_mode = true,
		enable_progress_notifications = true,
		flags = {
			noEmit = true,
			watch = false,
			incremental = true,
		},
		hide_progress_notifications_from_history = true,
		spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
		pretty_errors = true,
	},
}
