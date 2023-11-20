local M = {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = "LspAttach",
	config = true,
	opts = {
		align = {
			bottom = false,
			right = true,
		},
		text = {
			spinner = "dots_pulse",
			done = "✔ ",
			commenced = " ",
			completed = " ",
		},
		timer = {
			spinner_rate = 100,
			fidget_decay = 1000,
			task_decay = 500,
		},
		window = {
			relative = "editor",
			blend = 0,
			zindex = 1,
			border = "none",
		},
	},
}

return M
