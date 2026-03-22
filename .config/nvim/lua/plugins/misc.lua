return {
	-- bufferline -- tab list on the top
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- render markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- "echasnovski/mini.icons"
		opts = {},
	},

	-- maximize current pane with F3
	{ "szw/vim-maximizer" },

	-- dressing (telescope aesthetic?)
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- mini > surround -- quick surround text with quotes, brackets
	{
		"echasnovski/mini.surround",
		version = "*", -- use stable release version/tag
		opts = {},
	},

	-- undotree
	{
		"mbbill/undotree",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- whichkey -- shows keybinds info on keypress
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},

	-- Highlights comments like: todo, info, warn, hack, bug, fix etc.
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
		enabled = false,
	},

	-- Harpoon -- mark files for quick switch
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
		enabled = false,
	},
}
