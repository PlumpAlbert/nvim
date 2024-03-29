return {
	{
		"echasnovski/mini.indentscope",
		version = "*",
		enabled = false,
		lazy = false,
		config = true,
		opts = {
			symbol = "",
		},
	},
	{
		"echasnovski/mini.cursorword",
		version = "*",
		lazy = false,
	},
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
		opts = function()
			local highlights = {}

			if string.find(vim.cmd.colorscheme(), "catppuccin") then
				highlights =
					require("catppuccin.groups.integrations.bufferline").get()
			end

			return {
				options = {
					mode = "buffers",
					themable = true,
					numbers = "none",
					separator_style = "thick",
					always_show_bufferline = false,
					highlights = highlights or {},
				},
			}
		end,
		keys = {
			{
				"<S-h>",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Previous buffer",
			},
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				refresh = {
					statusline = 5000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			text = {
				spinner = "meter",
			},
		},
	},
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#00000088",
					top_down = false,
				},
				keys = {
					{
						"<leader>un",
						function()
							require("notify").dismiss()
						end,
						desc = "Dismiss notification",
					},
				},
			},
		},
		keys = {
			{
				"<leader>ul",
				function()
					require("noice").cmd("last")
				end,
				desc = "Show last notification",
			},
			{
				"<leader>uh",
				function()
					require("noice").cmd("telescope")
				end,
				desc = "Show notification history",
			},
		},
		opts = {
			lsp = {
				progress = { enabled = false },
				hover = { silent = true },
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
	{
		"chrisgrieser/nvim-early-retirement",
		config = true,
		event = "VeryLazy",
		opts = {
			retirementAgeMins = 5,
			minimumBufferNum = 1,
			ignoreUnsavedChangesBufs = true,
			ignoreSpecialBuftypes = true,
			ignoreVisibleBufs = true,
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
		event = "BufEnter",
		opts = {
			user_default_options = {
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "virtualtext", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = true,                   -- Enable tailwind colors
				-- parsers can contain values used in |user_default_options|
				sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
				virtualtext = "■",
				-- update color values even if buffer is not focused
				-- example use: cmp_menu, cmp_docs
				always_update = true,
			},
		},
	},
}
