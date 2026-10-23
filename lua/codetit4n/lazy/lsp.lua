return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"Julian/lean.nvim",
			init = function()
				vim.g.lean_config = {
					mappings = true,
					infoview = { orientation = "vertical", width = 50 },
					lsp = { enable = false },
				}
				vim.api.nvim_create_autocmd({ "BufWinEnter", "VimEnter", "VimResized" }, {
					group = vim.api.nvim_create_augroup("LeanInfoviewRight", { clear = true }),
					callback = function()
						vim.schedule(function()
							local infoview = require("lean.infoview").get_current_infoview()
							if infoview and infoview.window then
								infoview:move_to_right()
							end
						end)
					end,
				})
			end,
		},
		"williamboman/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local function get_highest_version(versions)
			table.sort(versions, function(a, b)
				local function version_to_tuple(v)
					local major, minor, patch = v:match("(%d+)%.(%d+)%.?(%d*)")
					return tonumber(major), tonumber(minor), tonumber(patch or "0")
				end

				local a1, a2, a3 = version_to_tuple(a)
				local b1, b2, b3 = version_to_tuple(b)

				if a1 ~= b1 then
					return a1 < b1
				elseif a2 ~= b2 then
					return a2 < b2
				else
					return a3 < b3
				end
			end)

			return versions[#versions]
		end

		local function parse_remappings()
			local remappings = {}
			local remappings_file = vim.fn.findfile("remappings.txt", ".;")

			if remappings_file == "" then
				return remappings
			end

			for line in io.lines(remappings_file) do
				local key, value = line:match("^(.-)%s*=%s*(.+)$")
				if key and value then
					remappings[key] = value
				end
			end

			return remappings
		end

		local function get_solidity_version()
			local foundry_toml = vim.fs.find("foundry.toml", {
				upward = true,
				type = "file",
			})

			if #foundry_toml > 0 then
				for line in io.lines(foundry_toml[1]) do
					local version = line:match('solc_version%s*=%s*"(.-)"')
					if version then
						return version
					end
				end
			end

			local hardhat_config = vim.fs.find({
				"hardhat.config.js",
				"hardhat.config.ts",
			}, {
				upward = true,
				type = "file",
			})

			if #hardhat_config > 0 then
				local versions = {}

				for line in io.lines(hardhat_config[1]) do
					for version in line:gmatch('version:%s*"(.-)"') do
						table.insert(versions, version)
					end
				end

				if #versions > 0 then
					return get_highest_version(versions)
				end
			end

			return "latest"
		end

		-- Neovim 0.12: rounded borders for floating windows
		vim.o.winborder = "rounded"

		-- Default capabilities inherited by every server
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Lua
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "Lua 5.1",
					},
					diagnostics = {
						globals = {
							"vim",
							"it",
							"describe",
							"before_each",
							"after_each",
						},
					},
				},
			},
		})

		-- Rust
		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
				},
			},
		})

		-- Solidity
		vim.lsp.config("solidity_ls", {
			cmd = {
				"vscode-solidity-server",
				"--stdio",
			},

			filetypes = {
				"solidity",
			},

			root_markers = {
				"foundry.toml",
				"hardhat.config.js",
				"hardhat.config.ts",
			},

			settings = {
				solidity = {
					compileUsingRemoteVersion = get_solidity_version(),
					defaultCompiler = "remote",
					enabledAsYouTypeCompilationErrorCheck = true,
					remapping = parse_remappings(),
				},
			},
		})

		-- Aptos Move
		vim.lsp.config("aptos_move_analyzer", {
			cmd = {
				"aptos-move-analyzer",
			},

			filetypes = {
				"move",
			},

			root_markers = {
				"Move.toml",
			},

			settings = {},
		})

		-- Fuel Sway
		vim.lsp.config("sway_lsp", {
			cmd = {
				"forc-lsp",
			},

			filetypes = {
				"sway",
			},

			root_markers = {
				"Forc.toml",
			},

			init_options = {
				logging = {
					level = "trace",
				},
			},

			settings = {},
		})

		-- Lean
		vim.lsp.config("leanls", {
			filetypes = {
				"lean",
			},
		})

		-- CMake Language Server
		-- Installed externally using uv with Python 3.13
		vim.lsp.config("cmake", {
			cmd = { "cmake-language-server" },
			filetypes = { "cmake" },
			root_markers = {
				"CMakeLists.txt",
				"cmake",
				".git",
			},
		})

		-- Mason
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"rust_analyzer",
				"jedi_language_server",
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"bashls",
				"asm_lsp",
				"solidity_ls",
				"yamlls",
			},
			automatic_enable = true,
		})

		-- Custom and externally installed servers
		vim.lsp.enable({
			"aptos_move_analyzer",
			"sway_lsp",
			"leanls",
			"cmake",
		})
	end,
}
