local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>t", builtin.find_files, {})
vim.keymap.set("n", "<leader>s", builtin.live_grep, {})
vim.keymap.set("n", "<leader>g", builtin.git_files, {})
