return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local border = "rounded"

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"rust_analyzer",
				"jedi_language_server",
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"solidity_ls_nomicfoundation",
				"bashls",
				"csharp_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = Capabilities,
						handlers = handlers,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = Capabilities,
						handlers = handlers,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		-- Custom LSPs

		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")

		-- Aptos Move language server
		-- install aptos move analyzer - cargo install --git https://github.com/movebit/move --branch feature/aptos_move_analyzer aptos-move-analyzer
		-- (last properly working version: 0.0.3)
		-- In case the branch is not available, try: cargo install --git https://github.com/codetit4n/move --branch feature/aptos_move_analyzer aptos-move-analyzer
		-- which is a fork of the original repository

		if not configs.aptos_move_analyzer then
			configs.aptos_move_analyzer = {
				default_config = {
					cmd = { "aptos-move-analyzer" },
					filetypes = { "move" },
					root_dir = function(fname)
						return vim.fs.dirname(vim.fs.find({ "Move.toml" }, { upward = true })[1])
					end,
					settings = {},
				},
			}
		end

		lspconfig.aptos_move_analyzer.setup({
			capabilities = Capabilities,
			handlers = handlers,
		})

		-- Fuel Sway language server (forc-lsp)
		-- Install Fuel sway language server - https://fuel.network
		if not configs.sway_lsp then
			configs.sway_lsp = {
				default_config = {
					cmd = { "forc-lsp" },
					filetypes = { "sway" },
					init_options = {
						-- Any initialization options
						logging = { level = "trace" },
					},
					root_dir = function(fname)
						return vim.fs.dirname(vim.fs.find({ "Forc.toml" }, { upward = true })[1])
					end,
					settings = {},
				},
			}
		end

		lspconfig.sway_lsp.setup({
			capabilities = Capabilities,
			handlers = handlers,
		})
	end,
}
