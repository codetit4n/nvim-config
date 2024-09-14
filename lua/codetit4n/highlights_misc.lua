-- nvim tree highlights
local modify_fg = "#FFA500"

vim.cmd(string.format(
	[[
    highlight OilVcsStatusModified guifg=%s gui=bold
    highlight OilVcsStatusUpstreamModified guifg=%s gui=bold
]],
	modify_fg,
	modify_fg
))
