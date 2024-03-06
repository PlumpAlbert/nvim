return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = true,
		opts = {
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"typescript-language-server",
				"html-lsp",
				"css-lsp",
				"emmet-ls",
				"eslint",
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}
		end,
	},

	{
		"stevearc/conform.nvim",
		config = true,
		opts = {
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
		},
	},
}
