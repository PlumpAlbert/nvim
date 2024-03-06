local M = {
	"stevearc/conform.nvim",
	config = true,
	opts = function(_, opts)
		opts = opts or {}

		local formatters_by_ft =
			vim.tbl_extend("force", opts.formatters_by_ft or {}, {
				formatters_by_ft = {
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					tsx = { "prettierd" },
					markdown = { "prettierd" },
					yaml = { "prettierd" },
					json = { "prettierd" },
					css = { "prettierd" },
					scss = { "prettierd" },
					sass = { "prettierd" },
					html = { "prettierd" },
				},
			})

		return vim.tbl_extend("force", opts, {
			formatters_by_ft = formatters_by_ft,
		})
	end,
}

return M
