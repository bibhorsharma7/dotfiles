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
		{ "<leader>fd", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find files" },
		{ "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Find files" },
	},
}
