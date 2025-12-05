return {
	"tpope/vim-fugitive",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Open git status" })
		vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Open git blame" })
		vim.keymap.set("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Open git log" })
	end,
}
