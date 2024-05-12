function ColorScheme(color)
	color = color or "base16-monokai"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Cursor", { bg = "none" })

	vim.cmd("highlight LineNr guibg=none")
	vim.cmd("highlight LineNr guifg=#a8a6a5")
	vim.cmd("highlight SignColumn guibg=none")
end

return {
	{
		"chriskempson/base16-vim",
		config = function()
			ColorScheme()
		end,
	},
}
