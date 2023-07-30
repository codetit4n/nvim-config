vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>\\", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>=", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>0", ":close<CR>") -- close current split window

keymap.set("n", "<leader>+", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>_", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>>", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader><", ":tabp<CR>") --  go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>") -- file explorer opens current file

-- telescope
keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<C-s>", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<C-c>", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- move lines up and down
keymap.set("n", "<leader>j", ":m +1<CR>")
keymap.set("n", "<leader>k", ":m -2<CR>")

-- Copilot Keymaps
keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")

-- disable arrow keys
keymap.set("n", "<up>", "<nop>")
keymap.set("n", "<down>", "<nop>")
keymap.set("n", "<left>", "<nop>")
keymap.set("n", "<right>", "<nop>")
keymap.set("v", "<up>", "<nop>")
keymap.set("v", "<down>", "<nop>")
keymap.set("v", "<left>", "<nop>")
keymap.set("v", "<right>", "<nop>")

-- movements
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- some search keymaps
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- open current file in firefox developer edition - browser I use for development
keymap.set("n", "<leader>br", ":!open % -a Firefox\\ Developer\\ Edition<CR>")
