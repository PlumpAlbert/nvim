local defaultFormatters = {
	lua = { "stylua" },
}

local M = {
	"stevearc/conform.nvim",
	dependencies = { "folke/neoconf.nvim" },
	event = { "LspAttach" },
	cmd = "ConformInfo",
}

M.keys = {
	{
		"<leader>lf",
		function()
			require("conform").format({
				async = true,
				lsp_fallback = true,
			})
		end,
		mode = { "n", "v" },
		desc = "Format file",
	},
}

M.init = function()
	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

	require("neoconf.plugins").register({
		name = "formatters",
		setup = function() end,
		on_schema = function(schema)
			schema:import("formatters", defaultFormatters)
			schema:set("formatters", {
				description = "Map of ft/formatter",
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

---@param formatters table
local function applySettings(formatters)
	local localFormatters =
		require("neoconf").get("formatters", defaultFormatters)

	local formatters_by_ft =
		vim.tbl_extend("force", formatters, localFormatters)

	return formatters_by_ft
end

M.config = function(_, opts)
	opts = opts or {}

	opts = vim.tbl_extend("force", opts, {
		formatters_by_ft = applySettings(opts.formatters_by_ft or {}),
		format_on_save = nil,
		format_after_save = {
			lsp_fallback = true,
			async = true,
		},
	})

	require("conform").setup(opts)
	require("mason-conform").setup()
end

return M
