return {
	"echasnovski/mini.icons",
	lazy = false,
	version = false,
	priority = 1000,
	config = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
}
