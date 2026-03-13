return {
	-- Git blame, does lot more (i need to read)
	-- also integrates with fugitive -> definitely read more
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			current_line_blame = true,
		},
		keys = {
			{ "<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Open git blame" },
		},
	},

	-- Fugitive
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Open git status" },
			{ "<leader>gl", "<cmd>Git log<CR>", desc = "Open git log" },
		},
	},
}
