return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				-- syntax highlighting
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = { enable = true },

				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},

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
					-- "query",
				},

				-- incremental_selection = {
				-- 	enable = true,
				-- 	keymaps = {
				-- 		init_selection = "<C-space>",
				-- 		node_incremental = "<C-space>",
				-- 		scope_incremental = false,
				-- 		node_decremental = "<bs>",
				-- 	},
				-- },
			})

			-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
			require("ts_context_commentstring").setup({})
		end,
	},
}
