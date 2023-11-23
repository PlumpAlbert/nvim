return {
	"kevinhwang91/nvim-ufo",
	enabled = false,
	name = "ufo",
	dependencies = { "kevinhwang91/promise-async" },
	keys = {
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
		},
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
		},
		{
			"zm",
			function()
				require("ufo").closeFoldsWith(0)
			end,
		},
		{
			"zr",
			function()
				require("ufo").openFoldsExceptKinds({ "imports", "comment" })
			end,
		},
	},
}
