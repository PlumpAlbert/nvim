return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		"s1n7ax/nvim-window-picker",
	},
	keys = {
		{
			"<leader>e",
			function()
				local current_file = vim.fn.expand("%:p")
				if current_file == "" then
					current_file = vim.fn.getcwd()
				else
					local f = io.open(current_file, "r")
					if f then
						f.close()
					else
						current_file = vim.fn.getcwd()
					end
				end
				require("neo-tree.command").execute({
					action = "focus",
					source = "filesystem",
					position = "float",
					reveal_file = current_file,
					reveal_force_cwd = true,
				})
			end,
			desc = "Open file explorer",
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(vim.tbl_deep_extend("force", {
			popup_border_style = "rounded",
			enable_git_status = false,
			enable_diagnostics = false,
			sort_case_insensitive = true,
			window = {
				position = "float",
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_hidden = false,
					hide_by_name = {
						".venv",
						"node_modules",
						".git",
					},
					always_show = {
						".gitignore",
					},
				},
			},
		}, opts or {}))
	end,
}
