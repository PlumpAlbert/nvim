-- vim:ft=lua:ts=4:sw=0:et
require 'neodev'.setup {}
local lsp = require 'lsp-zero'
lsp.set_preferences({
    setup_servers_on_start = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
    call_servers = 'local',
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})

vim.diagnostic.config({
    virtual_text = true
})

require 'core.config.lsp.servers.lua'.configure(lsp)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
lsp.setup_servers { opts = { capabilities = capabilities, } }
lsp.on_attach(function(client, buf)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Symbol info', noremap = true, })
    vim.keymap.set(
        { 'i', 'x' },
        '<C-h>',
        vim.lsp.buf.signature_help,
        { desc = 'Signature help', noremap = true, }
    )
    vim.keymap.set(
        'n',
        '<leader>lj',
        vim.diagnostic.goto_next,
        { desc = 'Next warning', noremap = true, }
    )
    vim.keymap.set(
        'n',
        '<leader>lk',
        vim.diagnostic.goto_prev,
        { desc = 'Previous warning', noremap = true, }
    )
    vim.keymap.set(
        'n',
        '<leader>la',
        vim.lsp.buf.code_action,
        { desc = 'Code actions', noremap = true, }
    )
    vim.keymap.set(
        'n',
        '<leader>lr',
        vim.lsp.buf.rename,
        { desc = 'Rename symbol', noremap = true, }
    )
    vim.keymap.set(
        { 'n', 'v' },
        '<leader>lf',
        function()
            vim.lsp.buf.format {
                filter = function(c)
                    return c.name ~= 'tsserver'
                end
            }
        end,
        { desc = 'Format document', noremap = true, }
    )
    vim.keymap.set(
        'n',
        'zM', require 'ufo'.closeAllFolds,
        { desc = "Close all folds", noremap = true }
    )
    vim.keymap.set(
        'n',
        'zR', require 'ufo'.openAllFolds,
        { desc = "Close all folds", noremap = true }
    )
    -- navigation
    vim.keymap.set(
        'n',
        'gd', vim.lsp.buf.definition,
        { desc = "Go to definition", noremap = true }
    )
    vim.keymap.set(
        'n',
        'gi', vim.lsp.buf.implementation,
        { desc = "Go to implementation", noremap = true }
    )
    vim.keymap.set(
        'n',
        'gr', vim.lsp.buf.references,
        { desc = "Go to references", noremap = true }
    )
    vim.keymap.set(
        'n',
        'gt', vim.lsp.buf.type_definition,
        { desc = "Go to type definition", noremap = true }
    )
    vim.keymap.set(
        'n',
        'gD', vim.lsp.buf.declaration,
        { desc = "Go to declaration", noremap = true }
    )
end)
lsp.setup()

require 'ufo'.setup {}
