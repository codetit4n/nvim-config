local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", ui.toggle_quick_menu, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>m", mark.add_file, { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", function()
	ui.nav_prev()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", function()
	ui.nav_next()
end, { noremap = true, silent = true })
