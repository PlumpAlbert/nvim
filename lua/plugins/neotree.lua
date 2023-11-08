local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	config = true,
}

M.dependencies = {
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.x",
		opts = {
			hint = "floating-big-letter",
			filter_rules = {
				autoselect_one = true,
				include_current_win = false,
				-- filter using buffer options
				bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					-- if the buffer type is one of following, the window will be ignored
					buftype = { "terminal", "quickfix" },
				},
			},
		},
	},
}

M.opts = {
	window = {
		position = "float",
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true,
			always_show = {
				".gitignore",
				".env",
				".env.local",
				".eslintrc.json",
				".prettierrc",
			},
			never_show = {
				".DS_Store",
				"thumbs.db",
				"node_modules",
			},
			follow_current_file = true,
		},
	},
	buffers = {
		follow_current_file = true,
	},
}

M.keys = {
	-- file explorer
	{
		"<leader>e",
		function()
			require("neo-tree.command").execute({
				toggle = true,
				source = "filesystem",
				position = "float",
			})
		end,
		desc = "Open neotree",
	},

	-- buffer explorer
	{
		"<leader>.",
		function()
			require("neo-tree.command").execute({
				toggle = true,
				source = "buffers",
				position = "float",
			})
		end,
		desc = "View buffers",
	},

	-- git status
	{
		"<leader>gs",
		function()
			require("neo-tree.command").execute({
				toggle = true,
				source = "git_status",
				position = "float",
			})
		end,
		desc = "Git status",
	},
}

return M
