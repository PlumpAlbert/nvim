local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

local function lsp_keymap(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	vim.keymap.set("n", "<leader>lI", "<cmd>Mason<cr>", opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<leader>lq", vim.diagnostic.setloclist, opts)
end

local ensure_installed = {
	"lua_ls",
	"tsserver",
	"emmet_ls",
	"cssls",
	"html",
}

M.opts = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	require("ufo").setup()

	return {
		ensure_installed = ensure_installed,
		handlers = {
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = function(_, bufnr)
						lsp_keymap(bufnr)
					end,
				})
			end,
		},
	}
end

return M
