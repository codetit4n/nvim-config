return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.14.0",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		-- Base setup
		require("nvim-tree").setup({
			sort = { sorter = "case_sensitive" },
			view = {
				width = 30,
				number = true,
				relativenumber = true,
			},
			renderer = {
				group_empty = true,
				highlight_git = true, -- color filenames by git status
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
						-- If you want arrow icons, uncomment:
						-- folder = { arrow_closed = "", arrow_open = "" },
					},
				},
			},
			filters = { dotfiles = false },
			git = { enable = true, ignore = false, timeout = 500 },
		})

		-- === Theme-aware Git colors for nvim-tree ===
		local function set_tree_git_colors()
			-- Prefer DiagnosticOk if the theme defines it; otherwise fall back to DiffAdd.
			local has_ok = pcall(vim.api.nvim_get_hl, 0, { name = "DiagnosticOk", link = false })
			local ok_link = has_ok and "DiagnosticOk" or "DiffAdd"

			-- Dirty (~) -> warn-ish (orange by theme)
			vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { link = "DiagnosticWarn" })

			-- New (+) -> ok/add (soft green by theme)
			vim.api.nvim_set_hl(0, "NvimTreeGitNew", { link = ok_link })
			vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon", { link = ok_link })
			vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { link = ok_link })
		end

		set_tree_git_colors()

		-- Reapply after any :colorscheme
		vim.api.nvim_create_autocmd("ColorScheme", {
			desc = "Reapply nvim-tree git highlight links after colorscheme loads",
			callback = set_tree_git_colors,
		})
	end,
}
