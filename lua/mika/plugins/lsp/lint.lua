local function lint_callback()
	require("lint").try_lint()
end

local defaultLinters = {
	lua = { "luacheck" },
}

local M = {
	"mfussenegger/nvim-lint",
	dependencies = { "folke/neoconf.nvim" },
	event = { "BufRead", "BufNewFile" },
}

M.keys = {
	{ "<leader>ll", lint_callback, desc = "Lint file" },
}

M.init = function()
	require("neoconf.plugins").register({
		name = "linters",
		on_schema = function(schema)
			schema:set("linters", {
				description = "Map of ft/linter",
				type = "object",
				additionalProperties = {
					type = "array",
					items = {
						type = "string",
					},
				},
			})
		end,
	})
end

M.config = function(_, linters_by_ft)
	local lint = require("lint")

	lint.linters_by_ft = vim.tbl_extend(
		"force",
		linters_by_ft,
		require("neoconf").get("linters", defaultLinters)
	)

	vim.api.nvim_create_autocmd({
		"BufEnter",
		"ModeChanged",
		"FileWritePost",
	}, {
		group = vim.api.nvim_create_augroup("linting", { clear = true }),
		callback = lint_callback,
	})
end

return M


