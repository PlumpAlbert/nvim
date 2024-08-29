local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	cmd = "FzfLua",
	config = function()
		require("fzf-lua").setup({
			"max-perf",
			fzf_colors = true,
			files = {
				git_icons = false,
				file_icons = false,
			},
			previewers = {
				bat = { theme = "ansi" },
				bat_native = { theme = "ansi" },
			},
			winopts = {
				border = "border",
				title = false,
				fullscreen = true,
				preview = {
					default = "builtin",
				},
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
	-- references
	{
		"<leader>ls",
		function()
			require("fzf-lua").lsp_references()
		end,
		desc = "LSP references",
	},
	-- definitions
	{
		"<leader>ld",
		function()
			require("fzf-lua").lsp_definitions()
		end,
		desc = "LSP definitions",
	},
	-- workspace symbols
	{
		"<leader>lS",
		function()
			require("fzf-lua").lsp_workspace_symbols()
		end,
		desc = "LSP workspace symbols",
	},
	-- code actions
	{
		"<leader>la",
		function()
			require("fzf-lua").lsp_code_actions({
				winopts = {
					border = "border",
					title = false,
					fullscreen = false,
					preview = {
						default = "builtin",
					},
				},
			})
		end,
		desc = "LSP workspace symbols",
	},
	-- type definitions
	{
		"<leader>lt",
		function()
			require("fzf-lua").lsp_typedefs({
				winopts = {
					border = "border",
					title = false,
					fullscreen = false,
					preview = {
						default = "builtin",
					},
				},
			})
		end,
		desc = "LSP workspace symbols",
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
