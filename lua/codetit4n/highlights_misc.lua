-- neo tree highlights
local modify_fg = "orange"

vim.cmd(string.format(
	[[
    highlight NeoTreeGitModified guifg=%s
]],
	modify_fg
))
