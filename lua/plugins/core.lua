-- vim:ft=lua:ts=4:sw=0:noet
return {
	{ "folke/which-key.nvim", config = true },
	{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
	{ "folke/neodev.nvim", config = true },
	{ "wakatime/vim-wakatime", event = "VeryLazy", config = function() end },
}
