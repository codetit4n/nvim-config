-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- change the colours of everything according to the theme
vim.cmd([[ highlight NvimTreeRootFolder guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeFolderIcon guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#d9a27e ]]) -- arrows color
vim.cmd([[ highlight NvimTreeFolderName guifg=white ]])
vim.cmd([[ highlight NvimTreeEmptyFolderName guifg=grey ]])
vim.cmd([[ highlight NvimTreeOpenedFolderName guifg=white ]])
vim.cmd([[ highlight NvimTreeGitDirty guifg=#a5918d ]])
vim.cmd([[ highlight NvimTreeGitStaged guifg=lightgreen ]])
vim.cmd([[ highlight NvimTreeGitDeleted guifg=#d9918d ]])
vim.cmd([[ highlight NvimTreeGitIgnored guifg=grey ]])
vim.cmd([[ highlight NvimTreeGitIgnoredFile guifg=grey ]])
vim.cmd([[ highlight NvimTreeGitNew guifg=#7cb262 ]])
vim.cmd([[ highlight NvimTreeGitRenamed guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeGitMerge guifg=yellow ]])
vim.cmd([[ highlight NvimTreeSymlink guifg=white ]])
vim.cmd([[ highlight NvimTreeExecFile guifg=white ]])
vim.cmd([[ highlight NvimTreeSpecialFile guifg=white ]])
vim.cmd([[ highlight NvimTreeImageFile guifg=white ]])
vim.cmd([[ highlight NvimTreeMarkdownFile guifg=white ]])
vim.cmd([[ highlight NvimTreeVertSplit guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeEndOfBuffer guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeStatuslineNc guifg=#afaf87 ]])
vim.cmd([[ highlight NvimTreeWindowPicker guifg=#afaf87 ]])

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
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
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
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
