return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = true },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- ensure these language parsers are installed
			ensure_installed = {
				"lua",
				"tsx",
				"css",
				"html",
				"yaml",
				"json",
				"bash",
				"markdown",
				"javascript",
				"typescript",
				"markdown_inline",
				"vim",
				"prisma",
				"svelte",
				"graphql",
				"dockerfile",
				"gitignore",
				"toml",
				"go",
			},
		})
	end,
}
