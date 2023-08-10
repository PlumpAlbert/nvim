return {
	{
		"catppuccin/nvim",
		priority = 9999,
		name = "catppuccin",
		opts = function()
			return {
				transparent_background = false,
				term_colors = true,
				compile = {
					enabled = true,
					path = vim.fn.stdpath("cache") .. "/catppuccin",
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					gitsigns = true,
					mason = true,
					mini = true,
					neotree = true,
					cmp = true,
					treesitter = true,
					ts_rainbow2 = true,
					telescope = true,
					which_key = true,
				},
				custom_highlights = function(C)
					return {
						CmpItemAbbr = { fg = C.overlay2 },
						CmpItemAbbrDeprecated = {
							fg = C.overlay0,
							style = { "strikethrough" },
						},
						CmpItemKind = { fg = C.blue },
						CmpItemMenu = { fg = C.text, bg = C.overlay4 },
						CmpItemAbbrMatch = { fg = C.text, style = { "bold" } },
						CmpItemAbbrMatchFuzzy = {
							fg = C.text,
							style = { "bold" },
						},

						-- kind support
						CmpItemKindSnippet = { bg = C.mauve, fg = C.base },
						CmpItemKindKeyword = { bg = C.red, fg = C.base },
						CmpItemKindText = { bg = C.teal, fg = C.base },
						CmpItemKindMethod = { bg = C.blue, fg = C.base },
						CmpItemKindConstructor = { bg = C.blue, fg = C.base },
						CmpItemKindFunction = { bg = C.blue, fg = C.base },
						CmpItemKindFolder = { bg = C.blue, fg = C.base },
						CmpItemKindModule = { bg = C.blue, fg = C.base },
						CmpItemKindConstant = { bg = C.peach, fg = C.base },
						CmpItemKindField = { bg = C.green, fg = C.base },
						CmpItemKindProperty = { bg = C.green, fg = C.base },
						CmpItemKindEnum = { bg = C.green, fg = C.base },
						CmpItemKindUnit = { bg = C.green, fg = C.base },
						CmpItemKindClass = { bg = C.yellow, fg = C.base },
						CmpItemKindVariable = { bg = C.flamingo, fg = C.base },
						CmpItemKindFile = { bg = C.blue, fg = C.base },
						CmpItemKindInterface = { bg = C.yellow, fg = C.base },
						CmpItemKindColor = { bg = C.red, fg = C.base },
						CmpItemKindReference = { bg = C.red, fg = C.base },
						CmpItemKindEnumMember = { bg = C.red, fg = C.base },
						CmpItemKindStruct = { bg = C.blue, fg = C.base },
						CmpItemKindValue = { bg = C.peach, fg = C.base },
						CmpItemKindEvent = { bg = C.blue, fg = C.base },
						CmpItemKindOperator = { bg = C.blue, fg = C.base },
						CmpItemKindTypeParameter = { bg = C.blue, fg = C.base },
						CmpItemKindCopilot = { bg = C.teal, fg = C.base },
					}
				end,
			}
		end,
		config = true,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 9999,
		config = true,
		opts = {
			undercurl = true,
			commentStyle = { italic = true },
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			background = {
				dark = "dragon",
				light = "lotus",
			},
		},
	},
	{
		"neanias/everforest-nvim",
		priority = 9999,
		name = "everforest",
		config = function()
			require("everforest").setup({
				background = "hard",
				disable_italic_comments = true,
				transparent_background_level = 2,
			})
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		priority = 9999,
		lazy = false,
		config = true,
		opts = {
			transparent = true,
			italic_comments = true,
		},
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		priority = 1000,
		lazy = false,
		init = function()
			local g = vim.g

			g.nightflyCursorColor = true
			g.nightflyTransparent = true
			g.nightflyVirtualTextColor = true
			g.nightflyWinSeparator = 2
			g.nightflyNormalFloat = true

			vim.lsp.handlers["textDocument/hover"] =
				vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signatureHelp,
				{ border = "single" }
			)
			vim.diagnostic.config({ float = { border = "single" } })
		end,
	},
}
