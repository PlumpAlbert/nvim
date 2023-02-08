return {
    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'p00f/nvim-ts-rainbow',
            'windwp/nvim-ts-autotag',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
          require "core.config.treesitter"
        end
    },
    { 'nvim-treesitter/nvim-treesitter-context',
        lazy = false,
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                -- For all filetypes
                -- Note that setting an entry here replaces all other patterns for this entry.
                -- By setting the 'default' entry below, you can control which nodes you want to
                -- appear in the context window.
                default = {
                    'class',
                    'function',
                    'method',
                    'for',
                    'while',
                    'if',
                    'switch',
                    'case',
                    'interface',
                    'struct',
                    'enum',
                },
                -- Patterns for specific filetypes
                -- If a pattern is missing, *open a PR* so everyone can benefit.
                tex = {
                    'chapter',
                    'section',
                    'subsection',
                    'subsubsection',
                },
                markdown = {
                    'section',
                },
                json = {
                    'pair',
                },
                typescript = {
                    'export_statement',
                },
                yaml = {
                    'block_mapping_pair',
                },
            },
            zindex = 20, -- The Z-index of the context window
            mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
        }
    },
    { 'p00f/nvim-ts-rainbow',                        lazy = false },
    { 'windwp/nvim-ts-autotag',                      lazy = false },
    { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = false },
}
