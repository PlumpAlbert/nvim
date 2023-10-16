vim.g.background = "dark"
local schemes = {
	"darkplus",
	"catppuccin",
	"github_dark",
}
vim.cmd.colorscheme(schemes[math.random(#schemes)])
