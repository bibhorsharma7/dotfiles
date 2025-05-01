return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- { "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybindings
			opts.desc = "LSP Hover Info"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "LSP Go to defenition"
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "LSP type definition"
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

			opts.desc = "LSP references Telescope"
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")

			opts.desc = "LSP implementations Telescope"
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")

			opts.desc = "LSP declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			-- Code Actions
			opts.desc = "LSP Code Action"
			vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, opts)
			-- Rename
			opts.desc = "LSP rename"
			vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)

			-- Diagnostics
			opts.desc = "Telescope diagnostics"
			vim.keymap.set("n", "<leader>G", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Open diagnostics"
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

			opts.desc = "Diagnostics: go to previous"
			vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, opts)

			opts.desc = "Diagnostics: go to next"
			vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, opts)

			-- -- Restart lsp
			-- opts.desc = "Restart LSP"
			-- vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		-- Diagnostic Signs
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- configure typescript server with plugin
		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure html lsp
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure toml server
		lspconfig["taplo"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
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

		lspconfig["yamlls"].setup({
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
	end,
}
