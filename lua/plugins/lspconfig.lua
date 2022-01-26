-- vim:ft=lua:ts=4:sw=0
local map = require("utils").map

local function on_attach(bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- LspSaga
	map("n", "gd", ":Lspsaga preview_definition<CR>")
	map("n", "<leader>rn", ":Lspsaga rename<CR>")
	map("n", "gh", ":Lspsaga lsp_finder<CR>")
	map("n", "<leader>ca", ":Lspsaga code_action<CR>")
	map("n", "<leader>k", ":Lspsaga signature_help<CR>")
	map("n", "K", ":Lspsaga hover_doc<CR>")
	-- scroll down hover doc or scroll in definition preview
	map("n", "<C-f>", ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
	-- scroll up hover doc
	map("n", "<C-f>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
	map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>")
	map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>")

	-- LSP
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	map("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>")
	map("n", "D", "<cmd>lua vim.diagnostic.open_float()<CR>")
	map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require "lspconfig"

local servers = {
	"html",
	"cssls",
	"emmet_ls",
	"intelephense",
	"pyright"
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = attach,
		capabilities = capabilities,
	}
end

local icons = {
   Text = "",
   Method = "",
   Function = "",
   Constructor = "",
   Field = "ﰠ",
   Variable = "",
   Class = "ﴯ",
   Interface = "",
   Module = "",
   Property = "ﰠ",
   Unit = "塞",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "פּ",
   Event = "",
   Operator = "",
   TypeParameter = "",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = icons[kind] or kind
end

local ts_utils = require "nvim-lsp-ts-utils"
lspconfig.tsserver.setup {
	init_options = ts_utils.init_options,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false

		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,
			import_all_timeout = 3000,
			import_all_priorities = {
				same_file = 1,
				local_file = 2,
				buffer_content = 3,
				buffers = 4
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,
			update_imports_on_move = true,
		})

		ts_utils.setup_client(client)

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ia", ":TSLspImportAll<CR>", { silent = true })
	end
}
