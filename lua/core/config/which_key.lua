-- vim:ft=lua:ts=4:sw=0:et:foldlevel=9999
vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require 'which-key'
wk.setup {
    presets = {
        g = true,
        text_objects = false,
    },
    triggers_blacklist = {
        v = { 's' }
    },
    disable = {
        filetypes = { "TelescopePrompt" }
    }
}

-- leader
wk.register({
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
    },
}, { prefix = '<leader>' })

return wk
