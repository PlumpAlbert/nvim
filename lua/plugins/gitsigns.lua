-- vim:ft=lua:ts=4:sw=0
local present, gitsigns = pcall(require, "gitsigns")
if present then
	local default = {
		signs = {
			add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
			change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
			delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
			topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
			changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
		},
	}
	if override_flag then
		default = require("core.utils").tbl_override_req("gitsigns", default)
	end
	gitsigns.setup(default)
end
