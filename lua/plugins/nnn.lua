-- vim:ft=lua:ts=4:sw=0
local nnn = require "nnn"

nnn.setup {
	explorer = {
		cmd = "nnn",       -- command overrride (-F1 flag is implied, -a flag is invalid!)
		width = 24,        -- width of the vertical split
		side = "botright",  -- or "topleft", location of the explorer window
		session = "shared",      -- or "global" / "local" / "shared"
		tabs = true,       -- seperate nnn instance per tab
	},
	picker = {
		cmd = "nnn",       -- command override (-p flag is implied)
		style = {
			width = 0.9,     -- percentage relative to terminal size when < 1, absolute otherwise
			height = 0.8,    -- ^
			xoffset = 0.5,   -- ^
			yoffset = 0.5,   -- ^
			border = "single"-- border decoration for example "rounded"(:h nvim_open_win)
		},
		session = "shared",      -- or "global" / "local" / "shared"
	},
	auto_open = {
		setup = "explorer",       -- or "explorer" / "picker", auto open on setup function
		tabpage = "explorer",     -- or "explorer" / "picker", auto open when opening new tabpage
		empty = true,     -- only auto open on empty buffer
		ft_ignore = {      -- dont auto open for these filetypes
			"gitcommit",
		}
	},
	auto_close = false,  -- close tabpage/nvim when nnn is last window
	replace_netrw = nil, -- or "explorer" / "picker"
	mappings = {
		{ "<C-t>", nnn.builtin.open_in_tab },       -- open file(s) in tab
		{ "<C-s>", nnn.builtin.open_in_split },     -- open file(s) in split
		{ "<C-v>", nnn.builtin.open_in_vsplit },    -- open file(s) in vertical split
		{ "<C-p>", nnn.builtin.open_in_preview },   -- open file in preview split keeping nnn focused
		{ "<C-y>", nnn.builtin.copy_to_clipboard }, -- copy file(s) to clipboard
		{ "<C-w>", nnn.builtin.cd_to_path },        -- cd to file directory
		{ "<C-e>", nnn.builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
	},
	windownav = {        -- window movement mappings to navigate out of nnn
		left = "<C-w>h",
		right = "<C-w>l"
	},
}

