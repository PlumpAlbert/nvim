local M = {
	"mfussenegger/nvim-lint",
	ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}
	end,
}

return M
