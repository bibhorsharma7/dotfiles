-- Formater
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out

	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout = 500,
			},

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" }, -- runs isort first then black

				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },

				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
			},
		})

		vim.keymap.set("n", "<leader>mp", function()
			conform.format({ lsp_fallback = true, async = false, timeout = 500 })
		end, { desc = "Format current file" })
	end,
}
