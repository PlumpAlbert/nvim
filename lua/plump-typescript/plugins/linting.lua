local M = {
	"mfussenegger/nvim-lint",
	ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	config = function()
		local linters = { "eslint_d", "cspell" }
		require("lint").linters_by_ft = {
			javascript = linters,
			javascriptreact = linters,
			typescript = linters,
			typescriptreact = linters,
		}
	end,
}

return M
