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
	-- Python
	b.formatting.autopep8.with {
		extra_args = {
			'--max-line-length', '80',
			'--experimental'
		}
	},
	-- PHP
	b.formatting.phpcsfixer,
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
