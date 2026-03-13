return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 32,
			},

			-- change folder arrow icons
			renderer = {
				group_empty = true, -- folders with single folder is grouped together
				indent_markers = {
					enable = true,
				},
			},

			-- disable window_picker for explorer to work well with window splits
			actions = {
				change_dir = {
					restrict_above_cwd = true,
				},
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
		vim.keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFile<CR>",
			{ desc = "Open file tree location for current file" }
		)
	end,
}
