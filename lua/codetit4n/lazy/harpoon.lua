return {

	{
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>ha", ui.toggle_quick_menu, { silent = true })
			vim.keymap.set("n", "<leader>m", mark.add_file, { silent = true })

			vim.keymap.set("n", "<C-p>", ui.nav_prev, { silent = true })
			vim.keymap.set("n", "<C-n>", ui.nav_next, { silent = true })
		end,
	},
}
