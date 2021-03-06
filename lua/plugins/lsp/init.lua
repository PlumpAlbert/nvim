-- vim:ft=lua:ts=4:sw=0
local M = {}
local map = require("utils").map

local includes = function(value)
    local excluded_servers = {
        'tsserver', 'html'
    }
    for _, server in ipairs(excluded_servers) do
        if value == server then
            return true
        end
    end
    return false
end

function format_document(bufnr, range)
    if range then
        vim.lsp.buf.range_formatting({
            timeout_ms = 10000,
            bufnr = bufnr,
        })
        return
    end
    vim.lsp.buf.format({
        timeout_ms = 10000,
        bufnr = bufnr,
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return not includes(client.name)
        end,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local format_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
    -- vim-illuminate
    if client['supports_method'] then
        require('illuminate').on_attach(client)
    end
    -- Enable completion triggered by <c-x><c-o>
    if bufnr then
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end

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
    map("n", "<leader>fm", string.format("<cmd>lua format_document(%s, false)<CR>", bufnr))
    map("v", "<leader>fm", string.format("<cmd>lua format_document(%s, true)<CR>", bufnr))
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
