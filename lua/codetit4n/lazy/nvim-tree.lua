return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
            	view = {
            		width = 30,
            		number = true,
            		relativenumber = true,
            	},
            	renderer = {
            		--highlight_git = true,
                    group_empty = true,
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
            					arrow_closed = "", -- arrow when folder is closed
            					arrow_open = "", -- arrow when folder is open
            				},
            			},
            		},
            	},
            	--actions = {
            	--	open_file = {
            	--		window_picker = {
            	--			enable = false,
            	--		},
            	--	},
            	--},
            	--git = {
            	--	enable = true,
            	--	ignore = false,
            	--	timeout = 500,
            	--},
            })
            end
        }

}
