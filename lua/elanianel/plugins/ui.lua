return {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        branch = 'v2.x',
        dependecies = {
            'plenary',
            'nvim-web-devicons',
            'nui'
        }
    }
}