local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	cmd = "FzfLua",
	config = function()
		require("fzf-lua").setup({
			"max-perf",
			winopts = {
				fullscreen = true,
			},
			keymap = {
				builtin = {
					true,
					["<up>"] = "preview-up",
					["<down>"] = "preview-down",
				},
				fzf = {
					true,
					["up"] = "preview-up",
					["down"] = "preview-down",
				},
			},
		})
	end,
}

M.keys = {
	-- files
	{
		"<leader><Space>",
		function()
			require("fzf-lua").files({ resume = false })
		end,
		desc = "Find files",
	},
	-- grep
	{
		"<leader>/",
		function()
			require("fzf-lua").live_grep_native()
		end,
		desc = "Live grep",
	},
	-- resume
	{
		"<leader>r",
		function()
			require("fzf-lua").resume()
		end,
		desc = "Resume fzf",
	},
	--#region GIT
	{
		"<leader>gl",
		function()
			require("fzf-lua").git_bcommits()
		end,
		desc = "Git log (buffer)",
	},
	--#endregion

	--#region LSP
	-- LSP finder
	{
		"<leader>ls",
		function()
			require("fzf-lua").lsp_finder()
		end,
		desc = "LSP Finder",
	},
	--#endregion

	-- buffers
	{
		"<leader>,",
		function()
			require("fzf-lua").buffers()
		end,
		desc = "LSP Finder",
	},
}

return M
