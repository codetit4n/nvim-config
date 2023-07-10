-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	definition = {
		edit = "<CR>",
	},
	symbol_in_winbar = {
		enable = true,
		separator = " > ",
		ignore_patterns = {},
		hide_keyword = true,
		show_file = true,
		respect_root = true,
		color_mode = true,
	},
})
