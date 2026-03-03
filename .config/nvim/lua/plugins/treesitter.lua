return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		local parsers = {
			"lua",
			"tsx",
			"css",
			"html",
			"yaml",
			"json",
			"toml",
			"bash",
			"zsh",
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
			"go",
		}
		treesitter.install(parsers)

		-- register parser with treesitter, and start parser for file
		for _, parser in ipairs(parsers) do
			local fileType = parser -- parser name is usually the fileType
			vim.treesitter.language.register(parser, fileType)

			vim.api.nvim_create_autocmd({ "FileType" }, {
				pattern = fileType,
				callback = function(event)
					vim.treesitter.start(event.buf, parser)
				end,
			})
		end
	end,
}
