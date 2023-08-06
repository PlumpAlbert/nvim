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
}
