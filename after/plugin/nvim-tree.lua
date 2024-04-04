-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set nvim-tree options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		number = true,
		relativenumber = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "~",
					staged = "✓",
					unmerged = "",
					renamed = "✎",
					untracked = "+",
					deleted = "-",
					ignored = "◌",
				},
				--folder = {
				--	arrow_closed = "", -- arrow when folder is closed
				--	arrow_open = "", -- arrow when folder is open
				--},
			},
			show = {
				git = true,
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
})

-- open nvim-tree on setup

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.cmd([[ highlight NvimTreeGitIgnoredFile guifg=grey ]])
vim.cmd([[ highlight NvimTreeGitIgnored guifg=grey ]])
vim.cmd([[ highlight NvimTreeGitDirtyIcon guifg=#FFAA33 ]])
vim.cmd([[ highlight NvimTreeGitNewIcon guifg=#7cb262 ]])
vim.cmd([[ highlight NvimTreeGitDeletedIcon guifg=#d9918d ]])
vim.cmd([[ highlight NvimTreeGitStagedIcon guifg=lightgreen ]])
vim.cmd([[ highlight NvimTreeGitRenamedIcon guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeGitMergeIcon guifg=orange ]])
vim.cmd([[ highlight NvimTreeLineNr guifg=none guibg=none ]])
vim.cmd([[ highlight NvimTreeCursorLine guifg=none guibg=#404040]])
vim.cmd([[ highlight NvimTreeCursorLineNr guibg=none]])
