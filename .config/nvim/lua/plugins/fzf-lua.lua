return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		files = {
			fd_opts = [[--color=never --hidden --type f --exclude .git]],
		},

		winopts = {
			preview = {
				hidden = false,
			},
		},
	},

	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files",
		},

		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Search in files",
		},

		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Search word under cursor",
		},
	},
}
