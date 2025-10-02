return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.14.0",
	dependencies = {
		-- old repo still redirects, but prefer the new canonical name:
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- (recommended by nvim-tree) disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- === Theme-aware Git colors for nvim-tree ===
		local function set_tree_git_colors()
			local has_ok = pcall(vim.api.nvim_get_hl, 0, { name = "DiagnosticOk", link = false })
			local ok_link = has_ok and "DiagnosticOk" or "DiffAdd"

			vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon", { link = "DiagnosticWarn" })
			vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { link = "DiagnosticWarn" })

			vim.api.nvim_set_hl(0, "NvimTreeGitNew", { link = ok_link })
			vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon", { link = ok_link })
			vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { link = ok_link })
		end

		vim.api.nvim_create_autocmd("ColorScheme", {
			desc = "Reapply nvim-tree git highlight links after colorscheme loads",
			callback = set_tree_git_colors,
		})

		require("nvim-tree").setup({
			sort = { sorter = "case_sensitive" },
			view = {
				width = 30,
				number = true,
				relativenumber = true,
			},
			renderer = {
				group_empty = true,
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
						-- folder = { arrow_closed = "", arrow_open = "" },
					},
				},
			},
			filters = { dotfiles = false },
			git = { enable = true, ignore = false, timeout = 500 },

			-- >>> All keymaps must be inside on_attach <<<
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				-- keep defaults, then override
				api.config.mappings.default_on_attach(bufnr)

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				vim.keymap.set("n", "y", api.fs.copy.node, { buffer = bufnr, desc = "Copy file to queue" })
				vim.keymap.set("n", "c", api.fs.copy.filename, opts("Yank Absolute Path"))
			end,
		})

		-- apply highlights once on startup
		set_tree_git_colors()
	end,
}
