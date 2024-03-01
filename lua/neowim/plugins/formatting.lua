return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = "ConformInfo",
	keys = {
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
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function(_, opts)
		opts = opts or {}
		local formatters_by_ft = vim.tbl_extend("force", { lua = { "stylua" } }, opts.formatters_by_ft or {})

		require("conform").setup(vim.tbl_extend("force", opts, {
			formatters_by_ft = formatters_by_ft,
			format_on_save = {
				async = true,
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		}))
	end,
}
