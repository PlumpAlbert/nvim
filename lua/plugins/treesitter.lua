return {
    {
        'HiPhish/nvim-ts-rainbow2',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            local rainbow = require 'ts-rainbow'
            require("nvim-treesitter.configs").setup {
                rainbow = {
                    query = {
                        'rainbow-parens',
                        html = 'rainbow-tags',
                        xml = 'rainbow-tags',
                        jsx = 'rainbow-tags',
                        tsx = 'rainbow-tags',
                    },
                    strategy = {
                        rainbow.strategy.global,
                        commonlisp = rainbow.strategy['local'],
                    },
                }
            }
        end
    },
    {
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
}
