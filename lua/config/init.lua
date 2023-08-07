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

--#region LSP
local LspGroup = vim.api.nvim_create_augroup("UserLspConfig", {})

vim.api.nvim_create_autocmd("LspAttach", {
	group = LspGroup,
	callback = function(ev)
		require("ufo").setup()
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		---@type LspKeymap[]
		local keys = require("config.servers.lsp").keys
		for _, keymap in pairs(keys) do
			vim.keymap.set(
				keymap.mode or { "n" },
				keymap.key,
				keymap.action,
				{ noremap = true, desc = keymap.desc, buffer = ev.buf }
			)
		end
	end,
})
--#endregion
