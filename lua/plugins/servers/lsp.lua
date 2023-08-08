return {
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		event = "VeryLazy",
		config = true,
		opts = {
			local_settings = ".neoconf.jsonc",
			import = {
				vscode = true,
				coc = true,
				nlsp = true,
			},
			live_reload = true,
			filetype_jsonc = true,
			plugins = {
				lspconfig = { enabled = true },
				jsonls = {
					enabled = true,
					configured_servers_only = true,
				},
				lua_ls = {
					enabled_for_neovim_config = true,
					enabled = true,
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"folke/neoconf.nvim",
		},
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		command = "Mason",
		build = ":MasonUpdate",
		config = true,
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
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		config = true,
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = function(_, opts)
			local lsp = require("lspconfig")
			local M = require("config.servers.lsp")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local handlers = {
				function(server_name)
					lsp[server_name].setup({
						capabilities = capabilities,
					})
				end,
			}

			for k, v in pairs(M.options) do
				handlers[k] = function()
					lsp[k].setup(vim.tbl_extend("force", v, {
						capabilities = capabilities,
					}))
				end
			end

			return vim.tbl_extend("force", opts, {
				ensure_installed = M.install,
				handlers = handlers,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "LspAttach",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"pontusk/cmp-sass-variables",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_lua").load({
						paths = vim.fn.stdpath("config") .. "/snippets",
					})
				end,
			},
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					}),
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
					{ name = "path" },
					{ name = "sass-variables" },
				}),
				experimental = {
					ghost_text = true,
				},
			})
		end,
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
}
