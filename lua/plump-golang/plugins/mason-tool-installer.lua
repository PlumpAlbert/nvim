local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = true,
	opts = function(_, opts)
		opts = opts or {}

		local ensure_installed = vim.tbl_extend("force", opts.ensure_installed or {}, {
			"gopls",
			"goimports",
			"golangci-lint",
		})

		return vim.tbl_extend("force", opts, {
			ensure_installed = ensure_installed,
		})
	end,
}

return M
