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
				---	folder = {
				---		arrow_closed = "", -- arrow when folder is closed
				---		arrow_open = "", -- arrow when folder is open
				---	},
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
-- change the colours of everything according to the theme
vim.cmd([[ highlight NvimTreeCursorLine guifg=none ]])
vim.cmd([[ highlight NvimTreeRootFolder guifg=#afaf87 ]])
--vim.cmd([[ highlight NvimTreeFolderIcon guifg=#afaf87 ]])
--vim.cmd([[ highlight NvimTreeFolderName guifg=lightgrey ]])
--vim.cmd([[ highlight NvimTreeEmptyFolderName guifg=lightgrey ]])
--vim.cmd([[ highlight NvimTreeOpenedFolderName guifg=lightgrey ]])
vim.cmd([[ highlight NvimTreeGitDirty guifg=#FFAA33 ]])
vim.cmd([[ highlight NvimTreeGitStaged guifg=lightgreen ]])
vim.cmd([[ highlight NvimTreeGitDeleted guifg=#d9918d ]])
vim.cmd([[ highlight NvimTreeGitIgnored guifg=grey ]])
vim.cmd([[ highlight NvimTreeGitIgnoredFile guifg=grey ]])
vim.cmd([[ highlight NvimTreeGitNew guifg=#7cb262 ]])
vim.cmd([[ highlight NvimTreeGitRenamed guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeGitMerge guifg=orange ]])
--vim.cmd([[ highlight NvimTreeSymlink guifg=white ]])
--vim.cmd([[ highlight NvimTreeExecFile guifg=white ]])
--vim.cmd([[ highlight NvimTreeSpecialFile guifg=white ]])
--vim.cmd([[ highlight NvimTreeImageFile guifg=white ]])
--vim.cmd([[ highlight NvimTreeVertSplit guifg=#afaf87 ]])
--vim.cmd([[ highlight NvimTreeEndOfBuffer guifg=#afaf87 ]])
--vim.cmd([[ highlight NvimTreeStatuslineNc guifg=#afaf87 ]])
--vim.cmd([[ highlight NvimTreeWindowPicker guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeLineNr guifg=white ]])
vim.cmd([[ highlight NvimTreeLineNr guibg=none ]])
