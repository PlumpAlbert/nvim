-- vim:ft=lua:ts=2:sw=0
local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local g = vim.g

g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
vim.g.nvim_tree_respect_buf_cwd = 1 -- Change cwd of nvim-tree to that of new buffer's when opening nvim-tree.

g.nvim_tree_show_icons = {
	folders = 1,
	files = 1,
	git = 1,
}

g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		deleted = "",
		ignored = "",
		renamed = "",
		staged = "",
		unmerged = "",
		unstaged = "",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
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
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		side = "right",
		width = 25,
		hide_root_folder = false,
		mappings = {
			custom_only = false,
			list = {
				{ key = ".", action = "toggle_dotfiles" },
			},
		},
	},
	git = {
		enable = true,
		ignore = true,
	},
	filters = {
		dotfiles = true,
	},
	renderer = {
		indent_markers = {
			enable = true
		}
	}
}

nvimtree.setup(default)
