return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			-- runners
			"nvim-neotest/neotest-plenary",
			"haydenmeade/neotest-jest",
		},
		opts = function()
			return {
				adapters = {
					require("neotest-plenary"),
					require("neotest-jest")({
						jestCommand = "npm run test --",
						jestConfigFile = "jest.config.js",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
			}
		end,
		keys = {
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run current file",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Run closest test",
			},
		},
	},
	{},
}
