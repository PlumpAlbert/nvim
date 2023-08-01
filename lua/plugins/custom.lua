return {
    { "wakatime/vim-wakatime", lazy = false },

    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#00000000",
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            window = {
                position = "float",
            },
            filesystem = {
                follow_current_file = {
                    enable = true,
                    leave_dirs_open = false,
                },
                always_show = {
                    ".gitignore",
                    ".prettierrc",
                    ".prettierrc.json",
                    ".prettierrc.yml",
                    ".prettierrc.yaml",
                    ".eslintrc.json",
                    ".eslintrc.yml",
                    ".eslintrc.yaml",
                    ".env",
                    ".env.local",
                    ".env.production",
                    ".env.development",
                    ".env.test",
                },
            },
        },
    },
}
