return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.6",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>t", builtin.find_files, {})
		vim.keymap.set("n", "<leader>r", builtin.registers, {})
		vim.keymap.set("n", "<leader>c", builtin.colorscheme, {})
		vim.keymap.set("n", "<leader>s", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
	end,
}
