-- vim:ft=lua:ts=4:sw=0:noet
return {
	{ import = "plugins.languages" },
	{ import = "plugins.servers" },

	{
		"folke/which-key.nvim",
		lazy = false,
		config = true,
	},
	{
		"direnv/direnv.vim",
		event = "VeryLazy",
	},
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		config = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				opts = {
					hint = "floating-big-letter",
					filter_rules = {
						autoselect_one = true,
						include_current = false,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = {
								"neo-tree",
								"neo-tree-popup",
								"notify",
								"fidget",
							},

							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix", "nofile" },
						},
					},
					-- other_win_hl_color = '#e35e4f',
				},
			},
		},
		opts = {
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			sort_case_insensitive = true, -- used when sorting files and directories in the tree
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					folder_empty_open = "󰜌",
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
				name = {
					trailing_slash = true,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
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
				commands = {
					delete = function(state)
						local inputs = require("neo-tree.ui.inputs")
						local path = state.tree:get_node().path

						inputs.confirm(
							"Wanna trash " .. path,
							function(confirmed)
								if not confirmed then
									return
								end
								vim.fn.system({
									"trash",
									vim.fn.fnameescape(path),
								})
								require("neo-tree.sources.manager").refresh(
									state.name
								)
							end
						)
					end,
					delete_visual = function(state, selected_nodes)
						local inputs = require("neo-tree.ui.inputs")

						-- get table items count
						function GetTableLen(tbl)
							local len = 0
							for n in pairs(tbl) do
								len = len + 1
							end
							return len
						end

						local count = GetTableLen(selected_nodes)
						local msg = "Are you sure you want to trash "
							.. count
							.. " files?"
						inputs.confirm(msg, function(confirmed)
							if not confirmed then
								return
							end
							for _, node in ipairs(selected_nodes) do
								vim.fn.system({
									"trash",
									vim.fn.fnameescape(node.path),
								})
							end
							require("neo-tree.sources.manager").refresh(
								state.name
							)
						end)
					end,
				},
				filtered_items = {
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_hidden = true, -- only works on Windows for hidden files/directories
					always_show = { -- remains visible even if other settings would normally hide it
						".gitignored",
						".env",
						".env.local",
						".github",
						--#region prettier
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yaml",
						".prettierrc.yml",
						"prettierrc.json",
						"prettierrc.yaml",
						"prettierrc.yml",
						--#endregion
						--#region eslint
						".eslintrc",
						".eslintrc.json",
						".eslintrc.yaml",
						".eslintrc.yml",
						"eslintrc.json",
						"eslintrc.yaml",
						"eslintrc.yml",
						--#endregion
					},
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						".DS_Store",
						"thumbs.db",
					},
				},
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = false,
			},
			buffers = {
				follow_current_file = {
					enabled = true,
				},
				group_empty_dirs = false,
				show_unloaded = true,
			},
			git_status = {
				window = {
					position = "float",
				},
			},
			sources = {
				"filesystem",
				"buffers",
				"document_symbols",
				"git_status",
			},
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree filesystem toggle float reveal<cr>",
				desc = "Open neotree",
			},
			{
				"<leader>ge",
				"<cmd>Neotree git_status toggle reveal<cr>",
				desc = "Browse changes",
			},
			{
				"<leader>le",
				"<cmd>Neotree document_symbols toggle<cr>",
				desc = "Browse symbols",
			},
			{
				"<C-b>",
				"<cmd>Neotree filesystem toggle right<cr>",
				desc = "Neotree (sidepanel)",
			},
		},
	},
	{
		"aserowy/tmux.nvim",
		lazy = false,
		config = true,
		opts = {
			resize = {
				enable_default_keybindings = false,
			},
		},
	},
}
