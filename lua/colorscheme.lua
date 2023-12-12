vim.g.background = "dark"
local schemes = {
	"vscode",
	"github_dark",
	"catppuccin",
	"gruvbox",
}

math.randomseed(os.time())
local function set_colorscheme()
	local scheme = schemes[math.random(#schemes)]
	vim.cmd.colorscheme(scheme)
end

set_colorscheme()
vim.keymap.set("n", "<F5>", set_colorscheme, { desc = "Random colorscheme" })
