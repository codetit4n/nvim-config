-- nvim tree highlights
local dirty_fg = "#f17e29"
local new_fg = "#47cf5b"
local deleted_fg = "#f12947"
local merge_fg = "orange"
local staged_fg = "lightgreen"
local cursorlinenr_bg = "none"

vim.cmd(
	string.format(
		[[
	hi NvimTreeGitFolderDirtyHL guifg=%s
    hi NvimTreeGitFileDirtyHL guifg=%s
    hi NvimTreeGitDirtyIcon guifg=%s
	hi NvimTreeGitFolderNewHL guifg=%s
    hi NvimTreeGitFileNewHL guifg=%s
	hi NvimTreeGitNewIcon guifg=%s
	hi NvimTreeGitFolderDeletedHL guifg=%s
	hi NvimTreeGitFileDeletedHL guifg=%s
	hi NvimTreeGitDeletedIcon guifg=%s
	hi NvimTreeGitFolderMergeHL guifg=%s
	hi NvimTreeGitFileMergeHL guifg=%s
    hi NvimTreeGitMergeIcon guifg=%s
	hi NvimTreeGitFolderStagedHL guifg=%s
	hi NvimTreeGitFileStagedHL guifg=%s
    hi NvimTreeGitStagedIcon guifg=%s
    hi NvimTreeCursorLineNr guibg=%s
]],
		dirty_fg,
		dirty_fg,
		dirty_fg,
		new_fg,
		new_fg,
		new_fg,
		deleted_fg,
		deleted_fg,
		deleted_fg,
		merge_fg,
		merge_fg,
		merge_fg,
		staged_fg,
		staged_fg,
		staged_fg,
		cursorlinenr_bg
	)
)

--
