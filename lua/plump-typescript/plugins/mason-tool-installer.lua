local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = true,
}

M.config = function(_, opts)
	opts = opts or {}

	local ensure_installed =
		vim.tbl_extend("force", opts.ensure_installed or {}, {
			"cspell",
			"prettierd",
			"eslint_d",
			"typescript-language-server",
			"html-lsp",
			"css-lsp",
			"emmet-ls",
			"eslint",
		})

	return vim.tbl_extend("force", opts, {
		ensure_installed = ensure_installed,
	})
end

return M
