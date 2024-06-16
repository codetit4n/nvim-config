function ColorScheme(color)
	--color = color or "base16-paraiso"
	color = color or "base16-ashes"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Cursor", { bg = "none" })

	vim.cmd("highlight LineNr guibg=none guifg=#a8a6a5")
	vim.cmd("highlight SignColumn guibg=none")
	vim.cmd("highlight NormalFloat guibg=black guifg=none")
end

return {
	{
		"chriskempson/base16-vim",
		config = function()
			ColorScheme()
		end,
	},
}
