require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_x = {
			{
				function()
					return "macOS"
				end,
				right_padding = 0,
			},
		},
	},
})
