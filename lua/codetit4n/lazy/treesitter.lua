return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({})

		local languages = {
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
			"python",
			"json",
			"markdown",
			"markdown_inline",
		}

		-- Install missing parsers
		treesitter.install(languages)

		-- Enable Treesitter highlighting and indentation
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"c",
				"cpp",
				"lua",
				"rust",
				"bash",
				"sh",
				"python",
				"json",
				"markdown",
				"gitignore",
				"vimdoc",
				"move",
			},

			callback = function(args)
				-- Start highlighting only if a parser is available
				pcall(vim.treesitter.start, args.buf)

				-- Preserve regular indentation for Markdown
				if vim.bo[args.buf].filetype ~= "markdown" then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})

		-- Custom Move parser
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				require("nvim-treesitter.parsers").move = {
					install_info = {
						url = "https://github.com/codeTIT4N/tree-sitter-move",
						files = { "src/parser.c" },
						branch = "master",
					},
				}
			end,
		})

		vim.treesitter.language.register("move", "move")
	end,
}
