return {
    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'p00f/nvim-ts-rainbow',
            'windwp/nvim-ts-autotag',
            'JoosepAlviste/nvim-ts-context-commentstring',
        }
    },
    { 'nvim-treesitter/nvim-treesitter-context',     lazy = false },
    { 'p00f/nvim-ts-rainbow',                        lazy = false },
    { 'windwp/nvim-ts-autotag',                      lazy = false },
    { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = false },
}
