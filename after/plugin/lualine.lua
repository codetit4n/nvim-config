require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_x = {
			{
				function()
					return " "
				end,
				right_padding = 0,
			},
		},
	},
})
