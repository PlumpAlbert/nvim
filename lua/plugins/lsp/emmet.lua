-- vim:ft=lua:ts=4:sw=0
-- Author: Plump Albert (plumpalbert@gmail.com)
local LSP = require "plugins.lsp.init"
local lspconfig = require "lspconfig"
local util = require 'lspconfig/util'

lspconfig.emmet_ls.setup{
	capabilities = LSP.capabilities,
	on_attach = LSP.on_attach,
	cmd = {'emmet-language-server', '--stdio'},
	root_dir = util.root_pattern("package.json", ".git"),
	filetypes = {
		'html',
		'typescriptreact',
		'javascriptreact',
		'javascript.jsx',
		'typescript.tsx',
		'css',
		'php',
		'blade',
	},
}
