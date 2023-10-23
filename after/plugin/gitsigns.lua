-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

-- configure/enable gitsigns
gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	on_attach = function(bufnr)
		vim.cmd([[
		      hi GitSignsAdd guifg=#98c379 guibg=#1e222a
		      hi GitSignsAddNr guifg=#98c379 guibg=#1e222a
		      hi GitSignsAddLn guifg=#98c379 guibg=#1e222a
		      hi GitSignsChange guifg=#61afef guibg=#1e222a
		      hi GitSignsChangeNr guifg=#61afef guibg=#1e222a
		      hi GitSignsChangeLn guifg=#61afef guibg=#1e222a
		      hi GitSignsDelete guifg=#e06c75 guibg=#1e222a
		      hi GitSignsDeleteNr guifg=#e06c75 guibg=#1e222a
		      hi GitSignsDeleteLn guifg=#e06c75 guibg=#1e222a
		    ]])
		vim.keymap.set(
			"n",
			"<leader>gp",
			require("gitsigns").prev_hunk,
			{ buffer = bufnr, desc = "[G]o to [P]revious Hunk" }
		)
		vim.keymap.set(
			"n",
			"<leader>gn",
			require("gitsigns").next_hunk,
			{ buffer = bufnr, desc = "[G]o to [N]ext Hunk" }
		)
		vim.keymap.set(
			"n",
			"<leader>ph",
			require("gitsigns").preview_hunk,
			{ buffer = bufnr, desc = "[P]review [H]unk" }
		)
	end,
})
