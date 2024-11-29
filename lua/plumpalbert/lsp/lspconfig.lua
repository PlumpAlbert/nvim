return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"iguanacucumber/magazine.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup(
				"plumpalbert-lsp-attach",
				{ clear = true }
			),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, {
						buffer = event.buf,
						desc = "LSP: " .. desc,
					})
				end

				map("gd", require("fzf-lua").lsp_definitions, "Definitions")

				map("gs", require("fzf-lua").lsp_finder, "Finder")

				map(
					"<leader>la",
					require("fzf-lua").lsp_code_actions,
					"Code actions"
				)

				map("K", vim.lsp.buf.hover, "Symbol hover")
			end,
		})

		require("mason").setup()

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			},
		})
	end,
}
