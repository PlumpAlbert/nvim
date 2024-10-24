return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = vim.fn.has("unix") and "make install_jsregexp" or nil,
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").load_standalone({
			path = ".vscode/project.code-snippets",
			lazy = true,
		})
	end,
}
