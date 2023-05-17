local ns = require("null-ls")

ns.setup({
	sources = {
		ns.builtins.diagnostics.eslint,
		ns.builtins.code_actions.eslint,
		ns.builtins.formatting.stylua,
		ns.builtins.formatting.prettier,
	},
})
