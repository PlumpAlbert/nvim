local M = {
	"tzachar/cmp-ai",
	dependencies = "nvim-lua/plenary.nvim",
}

M.config = function()
	local ai = require("cmp_ai.config")

	ai:setup({
		max_lines = 100,
		provider = "Ollama",
		notify = true,
		notify_callback = function(msg)
			vim.notify(msg, vim.log.levels.INFO)
		end,
		provider_options = {
			model = "codellama:7b-code",
			prompt = function(lines_before, lines_after)
				return lines_before
			end,
			suffix = function(lines_after)
				return lines_after
			end,
		},
	})
end

return M
