-- vim:ft=lua:ts=4:sw=0:et
vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require'which-key'
wk.setup { }

-- leader
wk.register({
    e = { vim.cmd.NeoTreeFocusToggle , 'NeoTree', },
    l = {
        j = { vim.diagnostic.goto_next, 'Next diagnostic' },
        k = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
        a = { vim.lsp.buf.code_action, 'Code actions' },
        r = { vim.lsp.buf.rename, 'Rename symbol' },
    },
    g = {
        d = { vim.lsp.buf.definition, 'Go to definition' },
        i = { vim.lsp.buf.implementation, 'Go to implementation' },
        r = { vim.lsp.buf.references, 'List references' },
        t = { vim.lsp.buf.type_definition, 'Go to type definition' },
        D = { vim.lsp.buf.type_definition, 'Go to declaration' },
    }
}, { prefix = '<leader>' })

-- global
wk.register({
    ['<C-h>'] = { vim.lsp.buf.signature_help, 'Signature help',  mode = 'i'  },
    K = { vim.lsp.buf.hover, 'Hover information' }
})

vim.pretty_print()
