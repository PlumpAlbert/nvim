require("neowim/options")

if vim.g.vscode then
	require("neowim/vscode-options")
	return
end

-- #region package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "neowim/plugins" },
		{
			"plumpalbert/nvim",
			branch = 'typescript',
			import = "plump-typescript"
		},
	},
	lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
	install = { colorscheme = { "onedark", "habamax", "default" } },
	checker = { enabled = true, notify = false }, -- automatically check for plugin updates
	change_detection = { enabled = true, notify = false }, -- automatically check for configuration update
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
-- #endregion
