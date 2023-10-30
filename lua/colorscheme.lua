vim.g.background = "dark"
local schemes = {
	"vscode",
	"catppuccin",
	"github_dark",
}

local function set_colorscheme()
	local scheme = schemes[math.random(#schemes)]
	vim.cmd.colorscheme(scheme)
end

set_colorscheme()
vim.keymap.set("n", "<leader><F5>", set_colorscheme, { desc = "Random colorscheme" })
