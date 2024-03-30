vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>") --temporary will remove later
vim.keymap.set("i", "<C-j>", "<ESC>")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
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
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true }) -- toggle file explorer
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true }) -- file explorer opens current file

-- nvim-neo-tree
--vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true }) -- toggle file explorer
--vim.keymap.set("n", "<leader>f", ":Neotree reveal<CR>", { silent = true }) -- file explorer opens current file

-- Drex
--vim.keymap.set("n", "<leader>e", ":DrexDrawerToggle<CR>", { silent = true }) -- toggle file explorer
--vim.keymap.set("n", "<leader>f", ":DrexDrawerFindFileAndFocus<CR>", { silent = true }) -- file explorer opens current file

-- copilot remaps
vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
vim.keymap.set("n", "<M-e>", ":Copilot enable<CR>")
vim.keymap.set("n", "<M-d>", ":Copilot disable<CR>")
vim.keymap.set("i", "<M-e>", "<ESC>:Copilot enable<CR>a")
vim.keymap.set("i", "<M-d>", "<ESC>:Copilot disable<CR>a")

vim.keymap.set("n", "ciw", '"_ciw')
vim.keymap.set("n", "x", '"_x')

-- Remap moving in panes to leader + hjkl
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
