-- vim:ft=lua:ts=4:sw=0:et
require 'neodev'.setup {}
local lsp = require 'lsp-zero'
lsp.set_preferences({
    setup_servers_on_start = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = true,
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
lsp.on_attach(function(_, bufnr)
    local function get_opts(opts)
        return vim.tbl_extend('force', { noremap = true, buffer = bufnr }, opts)
    end
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, get_opts { desc = 'Symbol info' })
    vim.keymap.set(
        { 'i', 'x' },
        '<C-h>',
        vim.lsp.buf.signature_help,
        get_opts { desc = 'Signature help' }
    )
    vim.keymap.set(
        'n',
        '<leader>lj',
        vim.diagnostic.goto_next,
        get_opts { desc = 'Next warning' }
    )
    vim.keymap.set(
        'n',
        '<leader>lk',
        vim.diagnostic.goto_prev,
        get_opts { desc = 'Previous warning' }
    )
    vim.keymap.set(
        'n',
        '<leader>la',
        vim.lsp.buf.code_action,
        get_opts { desc = 'Code actions' }
    )
    vim.keymap.set(
        'n',
        '<leader>lr',
        vim.lsp.buf.rename,
        get_opts { desc = 'Rename symbol' }
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
        get_opts { desc = 'Format document' }
    )
    vim.keymap.set(
        'n',
        'zM', require 'ufo'.closeAllFolds,
        get_opts { desc = "Close all folds" }
    )
    vim.keymap.set(
        'n',
        'zR', require 'ufo'.openAllFolds,
        get_opts { desc = "Close all folds" }
    )
    -- navigation
    vim.keymap.set(
        'n',
        'gd', vim.lsp.buf.definition,
        get_opts { desc = "Go to definition" }
    )
    vim.keymap.set(
        'n',
        'gi', vim.lsp.buf.implementation,
        get_opts { desc = "Go to implementation" }
    )
    vim.keymap.set(
        'n',
        'gr', vim.lsp.buf.references,
        get_opts { desc = "Go to references" }
    )
    vim.keymap.set(
        'n',
        'gt', vim.lsp.buf.type_definition,
        get_opts { desc = "Go to type definition" }
    )
    vim.keymap.set(
        'n',
        'gD', vim.lsp.buf.declaration,
        get_opts { desc = "Go to declaration" }
    )
end)
lsp.setup()

require 'ufo'.setup {}

return lsp
