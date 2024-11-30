local function get_formatters()
	return require("neoconf").get("formatters", { lua = { "stylua" } })
end

return {
	"stevearc/conform.nvim",
	dependencies = { "folke/neoconf.nvim" },
	init = function()
		require("neoconf.plugins").register({
			name = "conform.nvim",
			on_schema = function(schema)
				schema:set("formatters", {
					description = "Map of ft/formatter",
					type = "object",
					additionalProperties = {
						type = "array",
						items = { type = "string" },
					},
				})
			end,
			on_update = function()
				require("conform").formatters_by_ft = get_formatters()
			end,
		})
	end,
	config = function(_, opts)
		opts = opts or {}

		opts = vim.tbl_deep_extend("force", opts, {
			formatters_by_ft = get_formatters(),
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 10000,
			},
		})

		require("conform").setup(opts)
	end,

	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			desc = "Format buffer",
		},
	},
}
