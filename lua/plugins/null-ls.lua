-- vim:ft=lua:ts=4:sw=0
local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
	-- prettier
	b.formatting.prettier.with {
		extra_args = { '--config', vim.fn.expand('~/.prettierrc') },
	},
	 -- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}


null_ls.setup {
	debug = false,
	sources = sources,

	-- format on save
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
		end
	end,
}
