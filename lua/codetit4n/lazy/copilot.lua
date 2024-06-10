return {
	{
		"github/copilot.vim",
		config = function()
            -- Disable copilot by default
			vim.cmd("Copilot disable")
		end,
	},
}
