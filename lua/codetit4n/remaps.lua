vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- disable arrow keys in normal and visual mode
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("v", "<up>", "<nop>")
vim.keymap.set("v", "<down>", "<nop>")
vim.keymap.set("v", "<left>", "<nop>")
vim.keymap.set("v", "<right>", "<nop>")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- nvim tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>") -- file explorer opens current file

-- vim.keymap.set("n", "<leader>e", ":Explore<CR>") -- toggle file explorer

-- copilot remaps
vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")

vim.keymap.set("n", "ciw", '"_ciw')
vim.keymap.set("n", "x", '"_x')
