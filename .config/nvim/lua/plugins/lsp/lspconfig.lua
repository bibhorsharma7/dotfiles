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
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybindings
			opts.desc = "LSP Hover Info"
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Telescope LSP defenition"
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			-- opts.desc = "LSP type definition"
			-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

			opts.desc = "LSP references Telescope"
			vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>")

			opts.desc = "LSP declaration"
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

			-- Code Actions
			-- opts.desc = "LSP Code Action"
			-- vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, opts)
			-- Rename
			-- opts.desc = "LSP rename"
			-- vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)

			-- Diagnostics
			opts.desc = "Telescope diagnostics"
			vim.keymap.set("n", "<leader>G", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Open diagnostics"
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

			-- opts.desc = "Diagnostics: go to previous"
			-- vim.keymap.set("n", "<leader>gk", vim.diagnostic.goto_prev, opts)

			-- opts.desc = "Diagnostics: go to next"
			-- vim.keymap.set("n", "<leader>gj", vim.diagnostic.goto_next, opts)

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
