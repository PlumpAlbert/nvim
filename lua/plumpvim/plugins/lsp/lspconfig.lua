---@type vim.diagnostic.Opts
local diagnostic_config = {
	virtual_lines = { current_line = true },
	underline = false,
	float = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰃤',
			[vim.diagnostic.severity.WARN] = '󱈸',
			[vim.diagnostic.severity.INFO] = '󰙎',
			[vim.diagnostic.severity.HINT] = '',
		},
	},
}

return {
	'neovim/nvim-lspconfig',
	event = 'VeryLazy',
	dependencies = {
		'folke/neoconf.nvim',
		{ 'williamboman/mason.nvim', opts = {} },
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		{ 'j-hui/fidget.nvim', opts = {} },
		'L3MON4D3/LuaSnip',
		'saghen/blink.cmp',
		'b0o/schemastore.nvim',
	},
	keys = {
		{
			'<leader>d',
			function()
				local current = vim.diagnostic.config()
				if current ~= nil and (current.virtual_lines ~= nil and current.virtual_lines ~= false) then
					vim.diagnostic.config( --
						vim.tbl_deep_extend(
							'force', --
							current,
							{
								virtual_lines = false,
							}
						)
					)
				else
					vim.diagnostic.config(diagnostic_config)
				end
			end,
			desc = '[LSP] Toggle diagnostics',
		},
	},
	config = function()
		vim.diagnostic.config(diagnostic_config)

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('plumpvim-lsp-attach', { clear = true }),
			callback = function(event)
				local function map(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = '[LSP] ' .. desc })
				end

				map('K', function()
					vim.lsp.buf.hover {
						border = 'single',
					}
				end, 'Hover info')
				map('gd', vim.lsp.buf.definition, 'Go to definition')
				map('<F2>', vim.lsp.buf.rename, 'Rename')
			end,
		})

		require('neoconf').setup {
			live_reload = true,
			filetype_jsonc = false,
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
		}

		local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

		require('mason-tool-installer').setup { ensure_installed = { 'stylua', 'lua_ls' } }

		local function default_handler(name, opts)
			require('lspconfig')[name].setup(vim.tbl_extend('keep', {
				capabilities = capabilities,
			}, opts))
		end

		require('mason-lspconfig').setup {
			handlers = {
				function(name)
					default_handler(name, {})
				end,

				jsonls = function()
					default_handler('jsonls', {
						settings = {
							json = {
								schemas = require('schemastore').json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,

				yamlls = function()
					default_handler('yamlls', {
						settings = {
							yaml = {
								schemaStore = {
									enable = false,
									url = '',
								},
								schemas = require('schemastore').yaml.schemas(),
							},
						},
					})
				end,
			},
		}
	end,
}
