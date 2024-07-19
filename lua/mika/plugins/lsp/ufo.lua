local M = {
	"kevinhwang91/nvim-ufo",
	event = { "LspAttach" },
	config = false,
	dependencies = {
		"kevinhwang91/promise-async",
		"folke/neoconf.nvim",
	},
}

M.init = function()
	require("neoconf.plugins").register({
		name = "ufo",
		on_schema = function(schema)
			schema:import("ufo", { enable = true })
			schema:set("ufo.enable", {
				description = "Enable LSP foldings",
				type = "boolean",
			})
		end,
	})
end

return M
