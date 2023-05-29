local ns = require("null-ls")

ns.setup({
	sources = {
		-- DIAGNOSTICS
		ns.builtins.diagnostics.yamllint,
		ns.builtins.diagnostics.eslint,
		--
		-- CODE_ACTIONS
		ns.builtins.code_actions.eslint,
		--
		-- FORMATTING
		ns.builtins.formatting.stylua,
		ns.builtins.formatting.prettier,
		ns.builtins.formatting.shfmt,
		--
	},
})
