-- Options
vim.opt.nu = true -- line numbers
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4

-- vim.opt.isfname:append("@-@")
-- vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

-- Keybinds
vim.keymap.set("i", "hn", "<Esc>")

-- Move lines with J and K on selection mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stay in-place
-- vim.keymap.set("n", "J", "mzJ`z") -- bring next line up, cursor stay in-place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- void register paste and delete
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- asbjornHaland | copy to global clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- quick fix navigation
-- vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- replace all under cursor
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace all" })

-- cycle through buffers
vim.keymap.set("n", "<leader><tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader><S-tab>", "<cmd>bprev<CR>")
-- close buffer
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<CR><cmd>buffer<CR>")
