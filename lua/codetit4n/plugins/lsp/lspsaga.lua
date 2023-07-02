-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
	symbol_in_winbar = {
		enable = true,
		separator = " > ",
		ignore_patterns = {},
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
})
