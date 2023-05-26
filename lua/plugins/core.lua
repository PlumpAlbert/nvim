-- vim:ft=lua:ts=4:sw=0:noet
return {
	{
		"folke/which-key.nvim",
		lazy = false,
		config = true,
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf", lazy = false },
	{ "folke/neodev.nvim", ft = "lua", lazy = false },
	{
		"klen/nvim-config-local",
		lazy = false,
		opts = {
			silent = true,
			config_files = {
				".nvim.lua",
				".nvimrc",
				".vimrc.lua",
				".vimrc",
			},
		},
	},
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		config = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				opts = {
					autoselect_one = true,
					include_current = false,
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = {
								"neo-tree",
								"neo-tree-popup",
								"notify",
							},

							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
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
				filtered_items = {
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_hidden = true, -- only works on Windows for hidden files/directories
					always_show = { -- remains visible even if other settings would normally hide it
						".gitignored",
						".env",
						".env.local",
					},
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						".DS_Store",
						"thumbs.db",
					},
				},
				follow_current_file = true,
				group_empty_dirs = false,
			},
			buffers = {
				follow_current_file = true,
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
				"<cmd>Neotree filesystem toggle reveal<cr>",
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
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "folke/neoconf.nvim" },
		config = function()
			require("config.lsp").init()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"williamboman/mason.nvim",
				config = false,
				build = ":MasonUpdate",
				opts = {
					max_concurrent_installers = 2,
					ui = {
						border = "rounded",
						width = 0.8,
						height = 0.8,
						icons = {
							-- The list icon to use for installed packages.
							package_installed = "",
							-- The list icon to use for packages that are installing, or queued for installation.
							package_pending = "",
							-- The list icon to use for packages that are not installed.
							package_uninstalled = "",
						},
					},
				},
			},
		},
		config = function(_, opts)
			local ensure_installed = { "lua_ls" }

			if opts then
				ensure_installed = vim.list_extend(
					ensure_installed,
					opts.ensure_installed or {}
				)
			end

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("config.lsp").capabilities,
					})
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = require("config.lsp").capabilities,
						settings = {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								diagnostics = {
									-- Get the language server to recognize the `vim` global
									globals = { "vim", "awesome" },
								},
								workspace = {
									-- Make the server aware of Neovim runtime files
									library = vim.api.nvim_get_runtime_file(
										"",
										true
									),
									checkThirdParty = false,
								},
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			{
				"jose-elias-alvarez/null-ls.nvim",
				lazy = false,
				config = function()
					require("config.nullls")
				end,
			},
		},
		opts = {
			ensure_installed = { "stylua", "jq" },
			automatic_installation = true,
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = {
			"kevinhwang91/promise-async",
			"neovim/nvim-lspconfig",
		},
		config = false,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"FelipeLema/cmp-async-path",
			"pontusk/cmp-sass-variables",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		opts = function()
			local cmp = require("cmp")
			return {
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						col_offset = -3,
						side_padding = 0,
					},
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
						})(entry, vim_item)
						local strings =
							vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},
				mapping = {
					["<M-[>"] = cmp.mapping.scroll_docs(-4),
					["<M-]>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "async_path" },
					{ name = "sass-variables" },
				}),
			}
		end,
	},
}
