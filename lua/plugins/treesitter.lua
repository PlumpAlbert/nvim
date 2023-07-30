return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "HiPhish/nvim-ts-rainbow2",
            "windwp/nvim-ts-autotag",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        opts = function()
            return {
                autotag = { enable = true },
                context_commentstring = { enable = true },
                rainbow = {
                    enable = true,
                    -- Which query to use for finding delimiters
                    query = "rainbow-parens",
                    -- Highlight the entire buffer all at once
                    strategy = require("ts-rainbow").strategy.global,
                },
            }
        end,
    },
}
