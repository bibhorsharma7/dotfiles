return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						-- ["<C-k>"] = actions.move_selection_previous, -- move to prev result
						-- ["<C-j>"] = actions.move_selection_next, -- move to next result
						-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Search in files" })
		vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Find files" })
		-- vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
		-- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
	end,
}
