local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "VeryLazy" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"kevinhwang91/nvim-ufo",
			dependencies = { "kevinhwang91/promise-async" },
			keys = {
				{
					"zM",
					function()
						require("ufo").closeAllFolds()
					end,
				},
				{
					"zR",
					function()
						require("ufo").openAllFolds()
					end,
				},
				{
					"zm",
					function()
						require("ufo").closeFoldsWith(-1)
					end,
				},
				{
					"zr",
					function()
						require("ufo").closeFoldsWith(1)
					end,
				},
			},
		},
	},
	config = function()
		local signs = {
			{ name = "DiagnosticSignError", text = " " },
			{ name = "DiagnosticSignWarn", text = " " },
			{ name = "DiagnosticSignHint", text = " " },
			{ name = "DiagnosticSignInfo", text = " " },
		}

		for _, sign in pairs(signs) do
			vim.fn.sign_define(sign.name, {
				text = sign.text,
				texthl = sign.name,
				numhl = sign.name,
			})
		end

		vim.diagnostic.config({
			virtual_text = { severity = vim.diagnostic.severity.ERROR },
			signs = { active = signs },
			underline = true,
			update_in_insert = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "  Diagnostic",
				prefix = "",
				max_width = 80,
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			focusable = true,
			style = "minimal",
			border = "rounded",
			max_width = 80,
			max_height = 4,
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			focusable = true,
			style = "minimal",
			border = "rounded",
			max_width = 80,
			max_height = 4,
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false,
			signs = true,
			update_in_insert = false,
			max_width = 80,
			max_height = 4,
		})
	end,
}

return M
