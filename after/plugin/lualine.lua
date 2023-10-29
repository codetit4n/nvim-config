require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "ayu_dark",
		component_separators = { left = "|", right = "|" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {
			"encoding",
			function()
				return ""
			end,
			"filetype",
		},
		lualine_y = { "progress" },
	},
})
