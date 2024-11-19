return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	dependencies = {
		"folke/neoconf.nvim",
	},
	config = function()
		require("transparent").setup()
		require("transparent").clear_prefix("NeoTree")

		local config = require("neoconf").get("transparent", {
			enabled = false,
		})
		if config.enabled then
			vim.cmd("TransparentEnable")
		end
	end,
	init = function()
		require("neoconf.plugins").register({
			name = "transparent",
			on_schema = function(schema)
				schema:set("transparent.enabled", {
					type = "boolean",
					description = "Enable transparent background",
				})
			end,
		})
	end,
	cmd = {
		"TransparentEnable",
		"TransparentDisable",
		"TransparentToggle",
	},
}
