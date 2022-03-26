-- vim:ft=lua:ts=2:sw=0
local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local g = vim.g

g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
	folders = 1,
	files = 1,
	git = 1,
}

g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		deleted = "",
		ignored = "◌",
		renamed = "➜",
		staged = "✓",
		unmerged = "",
		unstaged = "✗",
		untracked = "★",
	},
	folder = {
		default = "",
		empty = "",
		empty_open = "",
		open = "",
		symlink = "",
		symlink_open = "",
	},
}

local default = {
	actions = {
		open_file = {
			window_picker = {
				exclude = {
					filetype = { "notify", "packer", "qf" },
					buftype = { "terminal" },
				},
			},
		},
	},
	disable_netrw = false,
	hijack_netrw = true,
	ignore_ft_on_setup = { "dashboard" },
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = false,
	update_focused_file = {
		enable = false,
		update_cwd = false,
	},
	view = {
		allow_resize = false,
		side = "right",
		width = 25,
		hide_root_folder = false,
	},
	git = {
		enable = true,
		ignore = true,
	},
	filters = {
		dotfiles = true,
	},
}

nvimtree.setup(default)
