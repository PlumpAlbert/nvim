return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
	},
	event = { "BufReadPre" },
	config = function(_, opts)
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		lsp_zero.set_server_config({
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			},
		})
	end,
}
