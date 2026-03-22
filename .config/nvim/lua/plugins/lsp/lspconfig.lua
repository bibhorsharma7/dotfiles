return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- { "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "LSP defenition"
			vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)

			opts.desc = "LSP declaration"
			vim.keymap.set("n", "grD", vim.lsp.buf.declaration, opts)

			opts.desc = "Telescope LSP references"
			vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Telescope LSP implementations"
			vim.keymap.set("n", "gri", "<cmd>Telescope lsp_implementations<CR>", opts)

			-- Diagnostics
			opts.desc = "Telescope list diagnostics in file"
			vim.keymap.set("n", "<leader>gg", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Open flaot diagnostic"
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

			opts.desc = "Diagnostics: go to previous"
			vim.keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, opts)

			opts.desc = "Diagnostics: go to next"
			vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, opts)
		end

		-- Diagnostic Signs
		vim.diagnostic.config({
			signs = {
				active = true,
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.HINT] = "Hint",
					[vim.diagnostic.severity.INFO] = "Info",
				},
			},
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- configure typescript server with plugin
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("ts_ls")

		-- configure html lsp
		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("html")

		-- configure toml server
		vim.lsp.config("taplo", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("taplo")

		-- configure go lsp server
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("gopls")

		-- configure css server
		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("cssls")

		-- configure tailwindcss server
		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("tailwindcss")

		-- configure python server
		vim.lsp.config("pyright", {
			capabilities = capabilities,
			on_attach = on_attach,
		})
		vim.lsp.enable("pyright")

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					-- workspace = {
					--   -- make language server aware of runtime files
					--   library = {
					--     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
					--     [vim.fn.stdpath("config") .. "/lua"] = true,
					--   },
					-- },
				},
			},
		})
		vim.lsp.enable("lua_ls")

		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				yaml = {
					schemaStore = {
						url = "https://www.schemastore.org/api/json/catalog.json",
						enable = true,
					},
					schemas = {
						["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = "template.{yml|yaml}",
					},
				},
			},
		})
		vim.lsp.enable("yamlls")
	end,
}
