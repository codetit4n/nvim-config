function ColorMyScreen(color)
	color = color or "material-deep-ocean"
	-- color = color or "github_dark_tritanopia"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Cursor", { bg = "gray" })
end
ColorMyScreen()
