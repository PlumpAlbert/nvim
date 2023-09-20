local M = {
	"mfussenegger/nvim-lint",
}

function M.config()
	local js = {
		"cspell",
		"eslint_d",
	}
	require("lint").linters_by_ft = {
		javascript = js,
		javascriptreact = js,
		typescript = js,
		typescriptreact = js,
	}
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

return M
