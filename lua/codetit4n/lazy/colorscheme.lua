function ColorScheme(color)
	--color = color or "base16-paraiso"
	color = color or "base16-outrun-dark"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Cursor", { bg = "none" })

	vim.cmd("highlight LineNr guibg=none guifg=#a8a6a5")
	vim.cmd("highlight SignColumn guibg=none")
	vim.cmd("highlight NormalFloat guibg=black guifg=none")

	-- In your colorscheme or init.lua
	vim.api.nvim_set_hl(0, "CopilotChatHeader", { fg = "#7C3AED", bold = true })
	vim.api.nvim_set_hl(0, "CopilotChatSeparator", { fg = "#374151" })
end

return {
	{
		"chriskempson/base16-vim",
		config = function()
			ColorScheme()
		end,
	},
}
