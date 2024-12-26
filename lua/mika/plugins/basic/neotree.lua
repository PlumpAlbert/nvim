local get_filepath = require("mika.utils.get_filepath")

local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
}

M.dependencies = {
	"nvim-lua/plenary.nvim",
	"echasnovski/mini.icons",
	"MunifTanjim/nui.nvim",
	"s1n7ax/nvim-window-picker",
	"saifulapm/neotree-file-nesting-config",
}

M.keys = {
	-- open file explorer
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
	-- open file explorer (at current file)
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
	-- open buffers
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
}

M.config = function(_, opts)
	require("neo-tree").setup(vim.tbl_deep_extend("force", {
		nesting_rules = require("neotree-file-nesting-config").nesting_rules,
		hide_root_node = true,
		retain_hidden_root_indent = true,
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
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
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
				show_hidden_count = false,
				never_show = {
					".DS_Store",
				},
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
end

return M
