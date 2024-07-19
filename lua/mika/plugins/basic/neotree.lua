local get_filepath = require("mika.utils.get_filepath")

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"echasnovski/mini.icons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			version = "2.*",
			config = true,
			opts = {
				hint = "statusline-winbar",
				picker_config = {
					statusline_winbar_picker = { use_winbar = "smart" },
				},
				filter_rules = {
					autoselect_one = true,
					include_current_win = false,
					bo = {
						filetype = { "neo-tree", "neo-tree-group", "notify" },
						buftype = { "terminal", "quickfix" },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({
					action = "focus",
					source = "filesystem",
					position = "float",
				})
			end,
			desc = "Open file explorer",
		},
		{
			"<leader>E",
			function()
				local current_file = get_filepath()
				require("neo-tree.command").execute({
					action = "focus",
					source = "filesystem",
					position = "float",
					reveal_file = current_file,
					reveal_force_cwd = true,
					toggle = true,
				})
			end,
			desc = "Open file explorer",
		},
		{
			"<leader>.",
			function()
				require("neo-tree.command").execute({
					action = "focus",
					source = "buffers",
					position = "float",
				})
			end,
			desc = "View open buffers",
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(vim.tbl_deep_extend("force", {
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = false,
			sort_case_insensitive = true,
			open_files_do_not_replace_types = {
				"terminal",
				"trouble",
				"qf",
			},
			default_component_configs = {
				git_status = {
					-- Change type
					added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "✖", -- this can only be used in the git_status source
					renamed = "󰁕", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
			window = {
				position = "float",
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
			filesystem = {
				follow_current_file = {
					leave_dirs_open = false,
				},
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_hidden = false,
					hide_by_name = {
						".venv",
						"node_modules",
						".git",
					},
					always_show = {
						".gitignore",
					},
				},
			},
		}, opts or {}))
	end,
}
