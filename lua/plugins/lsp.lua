local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "VeryLazy" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"kevinhwang91/nvim-ufo",
			name = "ufo",
			dependencies = { "kevinhwang91/promise-async" },
			config = true,
			opts = {
				open_fold_hl_timeout = 150,
				close_fold_kinds = { "imports", "comment" },
				preview = {
					win_config = {
						border = { "", "─", "", "", "", "─", "", "" },
						winhighlight = "Normal:Folded",
						winblend = 0,
					},
					mappings = {
						scrollU = "<C-u>",
						scrollD = "<C-d>",
						jumpTop = "[",
						jumpBot = "]",
					},
				},
				fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = (" 󰁂 %d "):format(endLnum - lnum)
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0
					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if targetWidth > curWidth + chunkWidth then
							table.insert(newVirtText, chunk)
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							local hlGroup = chunk[2]
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkWidth = vim.fn.strdisplaywidth(chunkText)
							-- str width returned from truncate() may less than 2nd argument, need padding
							if curWidth + chunkWidth < targetWidth then
								suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
							end
							break
						end
						curWidth = curWidth + chunkWidth
					end
					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end,
			},
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
						require("ufo").closeFoldsWith(0)
					end,
				},
				{
					"zr",
					function()
						require("ufo").openFoldsExceptKinds({ "imports", "comment" })
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
