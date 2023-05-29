return {
	"williamboman/mason-lspconfig.nvim",
	config = function(_, opts)
		return {
			ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
				"lua_ls",
			}),
			setup_handlers = vim.tbl_extend("force", opts.setup_handlers or {}, {
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
			}),
		}
	end,
}
