return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
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

		local capabilities = require("blink.cmp").get_lsp_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)

		require("mason").setup()

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
