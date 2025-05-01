return {
	{
		"rose-pine/neovim",
		tag = "v1.2.2",
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				-- for version 2
				-- styles = {
				-- 	bold = false,
				-- 	italic = false,
				-- 	transparency = true, -- transparent background not working
				-- },
				disable_italics = true,
				disable_background = true,
				disable_float_background = true,
			})
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
}
