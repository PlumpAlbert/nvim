-- vim:ft=lua:ts=4:sw=0
local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

local default = {
	ensure_installed = {
		"lua",
		"vim",
		"typescript",
		"php",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
}

ts_config.setup(default)
