local ns = require("null-ls")

ns.setup({
	sources = {
		ns.builtins.formatting.stylua,
	},
})
