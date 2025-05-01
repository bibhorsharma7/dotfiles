return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- lsp
				"html",
				"cssls",
				"lua_ls",
				"taplo", -- toml
				"yamlls",
				"pyright",
				"ts_ls",
				"tailwindcss",
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,

			-- handlers = {
			-- 	function(server_name)
			-- 		require("lspconfig")[server_name].setup({})
			-- 	end,
			-- 	["lua_ls"] = function()
			-- 		require("lspconfig").setup({
			-- 			settings = { -- custom settings for lua
			-- 				Lua = {
			-- 					-- make the language server recognize "vim" global
			-- 					diagnostics = {
			-- 						globals = { "vim" },
			-- 					},
			-- 					-- workspace = {
			-- 					--   -- make language server aware of runtime files
			-- 					--   library = {
			-- 					--     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
			-- 					--     [vim.fn.stdpath("config") .. "/lua"] = true,
			-- 					--   },
			-- 					-- },
			-- 				},
			-- 			},
			-- 		})
			-- 	end,
			-- },
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatter
				"isort", -- python
				"black", -- python
				"stylua",
				"prettierd",
				-- linter
				"pylint",
				"eslint_d",
			},
		})
	end,
}
