return {
	{
		"echasnovski/mini.indentscope",
		version = "*",
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
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
		opts = function()
			return {
				options = {
					mode = "buffers",
					themable = true,
					numbers = "none",
					separator_style = "thick",
					always_show_bufferline = false,
					highlights = require(
						"catppuccin.groups.integrations.bufferline"
					).get(),
				},
			}
		end,
		keys = {
			{
				"<M-h>",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Previous buffer",
			},
			{ "<M-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
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
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			text = {
				spinner = "hamburger",
			},
		},
	},
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			messages = { enabled = false },
			notify = { enabled = false },
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
}
