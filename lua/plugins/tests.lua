return {
    { import = "lazyvim.plugins.extras.test.core" },
    {
        "nvim-neotest/neotest",
        dependencies = { "haydenmeade/neotest-jest" },
        opts = function(_, opts)
            opts.adapters = vim.list_extend(opts.adapters, {
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    env = { CI = true },
                    cwd = function()
                        vim.fn.getcwd()
                    end,
                }),
            })
        end,
    },
}
