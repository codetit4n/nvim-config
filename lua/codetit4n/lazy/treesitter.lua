return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	lazy = false,

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"cpp",
				"tsx",
				"gitignore",
			},

			sync_install = false,
			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		})

		local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		treesitter_parser_config.move = {
			install_info = {
				url = "https://github.com/codeTIT4N/tree-sitter-move",
				files = { "src/parser.c" },
				branch = "master",
			},
		}

		vim.treesitter.language.register("move", "move")
	end,
}
