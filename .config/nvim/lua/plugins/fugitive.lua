return {
	"tpope/vim-fugitive",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Open git status" })
	end,
}
