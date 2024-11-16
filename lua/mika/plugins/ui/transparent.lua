return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").config()
		require("transparent").clear_prefix("NeoTree")
	end,
	cmd = {
		"TransparentEnable",
		"TransparentDisable",
		"TransparentToggle",
	},
}
