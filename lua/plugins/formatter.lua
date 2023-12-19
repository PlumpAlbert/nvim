local M = {
	"mhartington/formatter.nvim",
	cmd = {
		"Format",
		"FormatWrite",
		"FormatLock",
		"FormatWriteLock",
	},
}

function M.opts()
	local js = { require("formatter.defaults.prettier") }

	return {
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = { require("formatter.filetypes.lua").stylua },
			javascript = js,
			javascriptreact = js,
			typescript = js,
			typescriptreact = js,
			css = js,
			scss = js,
			sass = js,
			html = js,
			markdown = js,
			json = js,
			jsonc = js,
			yaml = { require("formatter.filetypes.yaml").prettier },
			["yaml.ansible"] = { require("formatter.filetypes.yaml").prettier },
			go = { require("formatter.filetypes.go").gofmt },
		},
	}
end

M.keys = {
	{ "<leader>lf", "<cmd>Format<cr>", desc = "Format buffer" },
	{ "<leader>lF", "<cmd>FormatWrite<cr>", desc = "Format buffer (write)" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("FormatAutogroup", {}),
	command = "FormatWrite",
})

return M
