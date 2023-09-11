local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", ui.toggle_quick_menu, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>m", mark.add_file, { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", ui.nav_next, { noremap = true, silent = true })
vim.keymap.set("n", "<C-m>", ui.nav_prev, { noremap = true, silent = true })
