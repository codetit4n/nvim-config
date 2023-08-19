require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"javascript",
		"typescript",
		"rust",
		"solidity",
		"json",
		"tsx",
		"jsonc",
		"dockerfile",
		"gitignore",
		"java",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.move = {
	install_info = {
		url = "https://github.com/codeTIT4N/tree-sitter-move", -- forked from https://github.com/yangzq12/tree-sitter-move
		files = { "src/parser.c" },
		branch = "master",
	},
	filetype = "move",
}
