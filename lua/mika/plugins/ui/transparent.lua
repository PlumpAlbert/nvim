return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup()
		require("transparent").clear_prefix("NeoTree")
	end,
	cmd = {
		"TransparentEnable",
		"TransparentDisable",
		"TransparentToggle",
	},
}
