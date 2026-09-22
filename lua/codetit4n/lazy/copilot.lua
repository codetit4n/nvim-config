return {
	{
		"github/copilot.vim",
		config = function()
			-- Use the language server bundled with copilot.vim
			-- instead of downloading/running it through npx.
			vim.g.copilot_version = false

			-- Disable Copilot by default.
			vim.cmd("Copilot disable")
		end,
	},
}
