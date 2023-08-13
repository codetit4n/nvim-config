function ColorMyScreen(color)
	color = color or "material-darker"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.cmd([[hi Cursor guibg=gray]])
end
ColorMyScreen()
