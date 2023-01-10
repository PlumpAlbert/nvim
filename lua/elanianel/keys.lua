-- vim:ft=lua:ts=4:sw=0:et
vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require 'which-key'
wk.setup {}

-- leader
wk.register({
    e = { vim.cmd.NeoTreeFocusToggle, 'NeoTree', },
    l = {
        name = 'LSP',
        j = { vim.diagnostic.goto_next, 'Next diagnostic' },
        k = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
        a = { vim.lsp.buf.code_action, 'Code actions' },
        r = { vim.lsp.buf.rename, 'Rename symbol' },
        f = { vim.lsp.buf.format, 'Format document', mode = { 'n', 'v' } },
    },
    g = {
        name = 'Go to',
        d = { vim.lsp.buf.definition, 'Go to definition' },
        i = { vim.lsp.buf.implementation, 'Go to implementation' },
        r = { vim.lsp.buf.references, 'List references' },
        t = { vim.lsp.buf.type_definition, 'Go to type definition' },
        D = { vim.lsp.buf.type_definition, 'Go to declaration' },
    },
    G = {
        name = 'Git',
        p = {
            function() vim.cmd.Gitsigns 'preview_hunk' end,
            'Preview hunk'
        },
        s = {
            function() vim.cmd.Gitsigns 'stage_hunk' end,
            'Stage hunk',
            mode = { 'v', 'n' }
        },
        v = {
            function() vim.cmd.Gitsigns 'select_hunk' end,
            'Select hunk',
        }
    },
    L = {
        name = 'Lazy',
        i = {
            function() vim.cmd.Lazy 'install' end,
            'Install plugins'
        },
        u = {
            function() vim.cmd.Lazy 'update' end,
            'Update plugins'
        },
        s = {
            function() vim.cmd.Lazy 'sync' end,
            'Sync plugins'
        },
        x = {
            function() vim.cmd.Lazy 'clean' end,
            'Clean plugins'
        },
        c = {
            function() vim.cmd.Lazy 'check' end,
            'Check plugins'
        },
    }
}, { prefix = '<leader>' })

-- global
wk.register({
    ['<C-h>'] = { vim.lsp.buf.signature_help, 'Signature help', mode = 'i' },
    K = { vim.lsp.buf.hover, 'Hover information' },
    [']c'] = { function() vim.cmd.Gitsigns 'next_hunk' end, 'Next hunk' },
    ['[c'] = { function() vim.cmd.Gitsigns 'prev_hunk' end, 'Previous hunk' }
})
