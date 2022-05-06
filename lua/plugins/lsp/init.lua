-- vim:ft=lua:ts=4:sw=0
local M = {}
local map = require("utils").map
function printtable(table, indent)
  print(tostring(table) .. '\n')
  for index, value in pairs(table) do 
    print('    ' .. tostring(index) .. ' : ' .. tostring(value) .. '\n')
  end
end

M.on_attach = function(client)
	printtable(client)
	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- LspSaga
	map("n", "gd", ":Lspsaga preview_definition<CR>")
	map("n", "<leader>rn", ":Lspsaga rename<CR>")
	map("n", "gh", ":Lspsaga lsp_finder<CR>")
	map("n", "<leader>ca", ":Lspsaga code_action<CR>")
	map("n", "<leader>k", ":Lspsaga signature_help<CR>")
	map("i", "<C-space>", "<cmd>Lspsaga signature_help<CR>")
	map("s", "<C-space>", "<cmd>Lspsaga signature_help<CR>")
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
M.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

M.handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

return M
