-- vim:ft=lua:ts=4:sw=0:et:foldlevel=9999
vim.o.timeout = true
vim.o.timeoutlen = 300

local presets = require 'which-key.plugins.presets'
presets.operators['zM'] = nil
presets.operators['zR'] = nil

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
        f = {
            function()
                vim.lsp.buf.format {
                    filter = function(client)
                        return client.name ~= 'tsserver'
                    end
                }
            end,
            'Format document',
            mode = { 'n', 'v' }
        },
    },
    g = {
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
    },
    s = {
        name = 'Telescope',
        f = { require 'telescope.builtin'.find_files, 'Find files in CWD' },
        t = { require 'telescope.builtin'.live_grep, 'Search text' },
        p = { function() vim.cmd.Telescope 'projects' end, 'Find projects' },
    },
    f = { require 'telescope.builtin'.git_files, 'Find Git files' },
    r = { require 'ssr'.open, 'Find and replace', mode = { 'n', 'x' } },
    c = { vim.cmd.BufferClose, 'Close buffer' }
}, { prefix = '<leader>' })

-- global
wk.register({
    ['<C-h>'] = { vim.lsp.buf.signature_help, 'Signature help', mode = 'i' },
    K = { vim.lsp.buf.hover, 'Hover information' },
    [']c'] = { function() vim.cmd.Gitsigns 'next_hunk' end, 'Next hunk' },
    ['[c'] = { function() vim.cmd.Gitsigns 'prev_hunk' end, 'Previous hunk' },
    ['zM'] = { require 'ufo'.closeAllFolds, 'Close all folds' },
    ['zR'] = { require 'ufo'.openAllFolds, 'Open all folds' },
    ['<M-h>'] = {
        function() require'bufferline.api'.goto_buffer_relative(-1) end,
        'Go to previous buffer'
    },
    ['<M-l>'] = {
        function() require'bufferline.api'.goto_buffer_relative(1) end,
        'Go to next buffer'
    },
    g = {
        name = 'Go to',
        d = { vim.lsp.buf.definition, 'Go to definition' },
        i = { vim.lsp.buf.implementation, 'Go to implementation' },
        r = { vim.lsp.buf.references, 'List references' },
        t = { vim.lsp.buf.type_definition, 'Go to type definition' },
        D = { vim.lsp.buf.type_definition, 'Go to declaration' },
    },
})
