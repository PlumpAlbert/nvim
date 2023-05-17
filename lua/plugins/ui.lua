return {
	{
		"echasnovski/mini.cursorword",
		version = "*",
		event = "BufEnter",
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
		lazy = false,
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			text = {
				spinner = "hamburger",
			},
		},
	},
}
