local ns = require("null-ls")

ns.setup({
	sources = {
		ns.builtins.diagnostics.eslint_d,
		ns.builtins.formatting.stylua,
		ns.builtins.formatting.prettier,
	},
})
