local M = {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "VeryLazy" },
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
	vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts)

	-- display diagnostics on hover
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			})
		end,
	})
end

local ensure_installed = {
	"lua_ls",
	"tsserver",
	"eslint",
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

			lua_ls = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
								path = vim.split(package.path, ";"),
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = { enable = false },
						},
					},
					on_attach = function(_, bufnr)
						lsp_keymap(bufnr)
					end,
				})
			end,
		},
	}
end

return M