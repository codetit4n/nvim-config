function ColorMyScreen(color)
	color = color or "base16-circus"
	-- color = color or "github_dark_tritanopia"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Cursor", { bg = "none" })

	vim.cmd("highlight LineNr guibg=none")
	vim.cmd("highlight LineNr guifg=none")
	vim.cmd("highlight SignColumn guibg=none")
end
ColorMyScreen()
