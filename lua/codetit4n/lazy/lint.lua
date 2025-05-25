return {

	"mfussenegger/nvim-lint",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		require("mason-tool-installer").setup({

			ensure_installed = {
				"eslint_d",
			},
			run_on_start = true,
		})

		local function eslint_config_exists()
			local config_patterns = {
				".eslintrc.*", -- This will match .eslintrc.json, .eslintrc.js, .eslintrc.cjs, .eslintrc.yml, .eslintrc.yaml, etc.
				"package.json", -- Special case for package.json with eslintConfig
			}

			for _, pattern in ipairs(config_patterns) do
				-- Use glob to find matching files
				local files = vim.fn.glob(vim.fn.getcwd() .. "/" .. pattern, 0, 1)
				for _, file in ipairs(files) do
					if vim.fn.fnamemodify(file, ":t") == "package.json" then
						-- Check if package.json contains "eslintConfig"
						local package_json = vim.fn.json_decode(vim.fn.readfile(file))
						if package_json["eslintConfig"] then
							return true
						end
					else
						return true -- Found a matching .eslintrc.* file
					end
				end
			end
			return false
		end

		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascriptreact = { "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
		}, {
			group = lint_augroup,
			callback = function()
				if eslint_config_exists() then
					lint.try_lint()
				end
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			if eslint_config_exists() then
				lint.try_lint()
			else
				print("No ESLint config found!")
			end
		end)
	end,
}
