local M = {
	"tzachar/cmp-ai",
	enabled = vim.fn.has("unix") == 1 and vim.fn.has("wsl") == 0,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/neoconf.nvim",
	},
}

M.init = function()
	require("neoconf.plugins").register({
		name = "llm",
		on_schema = function(schema)
			schema:set("llm", { type = "string" })
		end,
	})
end

M.config = function()
	local ai = require("cmp_ai.config")

	local model = require("neoconf").get("llm", "codegemma:2b")

	ai:setup({
		max_lines = 100,
		provider = "Ollama",
		notify = true,
		notify_callback = function(msg)
			vim.notify(msg, vim.log.levels.INFO)
		end,
		provider_options = { model = model },
	})
end

return M
