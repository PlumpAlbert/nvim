local M = {
	"tzachar/cmp-ai",
	enabled = vim.fn.has("unix") == 1 and vim.fn.has("wsl") == 0,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/neoconf.nvim",
	},
}

local defaultOptions = {
	model = "deepseek-coder-v2",
	enabled = true,
}

M.init = function()
	require("neoconf.plugins").register({
		name = "llm",
		on_schema = function(schema)
			schema:set("llm", {
				type = "object",
				description = "Configuration for cmp-AI",
				required = { "model" },
				properties = {
					model = {
						type = "string",
						description = "Model name to use",
					},
					enabled = {
						type = "boolean",
						description = "Enable plugin",
					},
				},
			})
		end,
	})
end

M.config = function()
	local ai = require("cmp_ai.config")

	local opts = require("neoconf").get("llm", defaultOptions)

	if not opts.enabled then
		return
	end

	ai:setup({
		max_lines = 100,
		provider = "Ollama",
		notify = true,
		notify_callback = function(msg)
			vim.notify(msg, vim.log.levels.INFO)
		end,
		provider_options = { model = opts.model },
	})
end

return M
