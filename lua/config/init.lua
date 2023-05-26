require("config.lazy")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.css", "*.scss", "*.sass" },
	callback = function()
		vim.lsp.buf.format({
			async = true,
			bufnr = 0,
			filter = function(c)
				return c.name ~= "tsserver"
			end,
		})
	end,
})
