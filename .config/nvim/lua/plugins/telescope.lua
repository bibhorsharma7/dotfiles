return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		defaults = {
			path_display = { "truncate " },
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
		},
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search in files" },
		{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Search in files" },
	},
}
