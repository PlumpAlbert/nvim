-- vim:ft=lua:ts=4:sw=0
local M = {}
local map = require("utils").map

local includes = function(value)
    local excluded_servers = {
        'tsserver', 'html', 'volar'
    }
    for _, server in ipairs(excluded_servers) do
        if value == server then
            return true
        end
    end
    return false
end

function format_document(range)
    local bufnr = vim.fn.bufnr('%')
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

M.format = format_document

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    if bufnr then
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end
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
