return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			window = {
				layout = "float",
				title = "  Copilot AI",
				relative = "cursor",
				width = 1,
				height = 1,
			},

			headers = {
				user = "👤codetit4n",
				assistant = "  Copilot",
				tool = "🔧 Tool",
			},

			separator = "━━",
			auto_fold = true, -- Automatically folds non-assistant messages
		},
	},
}
