local M = {
	"stevearc/conform.nvim",
	config = true,
	---@param opts table|nil
	opts = function(_, opts)
		opts = opts or {}

		local formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft or {}, {
			go = { "goimports", "gofumpt" },
			gomod = { "goimports", "gofumpt" },
		})

		return vim.tbl_extend("force", opts, {
			formatters_by_ft,
		})
	end,
}

return M
