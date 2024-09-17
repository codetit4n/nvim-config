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
--vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true }) -- toggle file explorer
--vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true }) -- file explorer opens current file

-- oil nvim
vim.keymap.set("n", "<leader>f", ":Oil<CR>", { silent = true }) -- open file explorer
vim.keymap.set("n", "<leader>e", ":Oil .<CR>", { silent = true }) -- open file explorer in base directory

-- copilot and copilot chat remaps
vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
vim.keymap.set("n", "<M-2>", ":Copilot enable<CR>")
vim.keymap.set("n", "<M-1>", ":Copilot disable<CR>")
vim.keymap.set("i", "<M-2>", "<ESC>:Copilot enable<CR>a")
vim.keymap.set("i", "<M-1>", "<ESC>:Copilot disable<CR>a")
vim.keymap.set("n", "<M-@>", ":Copilot enable<CR>")
vim.keymap.set("n", "<M-!>", ":Copilot disable<CR>")
vim.keymap.set("i", "<M-@>", "<ESC>:Copilot enable<CR>a")
vim.keymap.set("i", "<M-!>", "<ESC>:Copilot disable<CR>a")
vim.keymap.set("n", "<leader>ch", ":CopilotChat<CR>")
vim.keymap.set("n", "<leader>ce", ":CopilotChatExplain<CR>")

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { silent = true })

vim.keymap.set("n", "ciw", '"_ciw')
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>.", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>,", ":vertical resize -5<CR>", { silent = true })

-- Enable/Disable relative line numbers -- TODO
--vim.keymap.set("n", "<C-E>", ":setlocal relativenumber<CR>" , { silent = true})
--vim.keymap.set("n", "<C-e>", ":setlocal norelativenumber<CR>" , { silent = true})
