-- using this becaue formatter.nvim doesn't have ensure_installed
require("mason-tool-installer").setup({

	-- a list of all tools you want to ensure are installed upon
	-- start; they should be the names Mason uses for each tool
	-- PLEASE NOTE: Only tools for formatters and linters here for clarity
	ensure_installed = {
		"stylua",
		"clang-format",
		"prettier",
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	-- auto_update = false,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
	-- Default: 0
	-- start_delay = 3000, -- 3 second delay

	-- Only attempt to install if 'debounce_hours' number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
	-- This is only relevant when you are using 'run_on_start'. It has no
	-- effect when running manually via ':MasonToolsInstall' etc....
	-- Default: nil
	-- debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

-- Utilities for creating configurations
local util = require("formatter.util")

-- Function to print error message in red -- todo - look into this
--local function printError(message)
--    -- ANSI escape code for red color
--    local RED = "\27[31m"
--
--    -- Concatenate error message with red color code
--    io.write(RED .. message)
--end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		-- Movefmt formatter for Move language
		-- Install movefmt - cargo install --git https://github.com/movebit/movefmt --branch develop movefmt
		-- (last working version: 0.1.0)
		move = {
			function()
				-- some magic to check if file has a parse error before formatting
				local success, msg = pcall(function()
					local res = vim.fn.systemlist(
						"movefmt "
							.. util.escape_path(util.get_current_buffer_file_path())
							.. " --emit stdout"
							.. " | grep 'ERROR' | grep 'movefmt' | wc -l"
					)
					if tonumber(res[2]) == 0 then
						return true
					else
						error("ERROR: parse not ok!")
					end
				end)
				if not success then
                    -- print error message - todo
					return nil
				end

				return {
					exe = "movefmt",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
						"--emit",
						"stdout",
					},
					stdin = true,
				}
			end,
		},
		-- Since rustfmt is deprecated, install it using rustup
		rust = {
			function()
				return {
					exe = "rustfmt --edition 2021",
					args = { "--emit", "stdout" },
					stdin = true,
				}
			end,
		},
		-- Formatter configurations for c, cpp, cs
		c = {
			-- "formatter.filetypes.c" defines default configurations for the
			-- "c" filetype
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			-- "formatter.filetypes.cpp" defines default configurations for the
			-- "cpp" filetype

			require("formatter.filetypes.cpp").clangformat,
		},
		cs = {
			-- "formatter.filetypes.cs" defines default configurations for the
			-- "cs" filetype
			require("formatter.filetypes.cs").clangformat,
		},
		-- Formatter configurations for filetype "java"
		java = {
			-- "formatter.filetypes.java" defines default configurations for the
			-- "java" filetype
			require("formatter.filetypes.java").clangformat,
		},
		-- Formatter configurations for filetype "javascript", "javascriptreact", "typescript", "typescriptreact" go here
		javascript = {
			-- "formatter.filetypes.javascript" defines default configurations for the
			-- "javascript" filetype
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			-- "formatter.filetypes.javascriptreact" defines default configurations for the
			-- "javascriptreact" filetype
			require("formatter.filetypes.javascriptreact").prettier,
		},
		typescript = {
			-- "formatter.filetypes.typescript" defines default configurations for the
			-- "typescript" filetype
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			-- "formatter.filetypes.typescriptreact" defines default configurations for the
			-- "typescriptreact" filetype
			require("formatter.filetypes.typescriptreact").prettier,
		},
		-- since no formatter for solidity, using forge - make sure it is installed
		solidity = {
			function()
				return {
					exe = "forge",
					args = { "fmt" },
					stdin = false,
				}
			end,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
	},
})

-- Format on save only if the file has been changed
vim.api.nvim_exec(
	[[  augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.lua,*.rs,*.c,*.cpp,*.cs,*.js,*.jsx,*.ts,*.tsx,*.sol,*.md,*.json,*.java,*.move :silent! FormatWrite
    augroup END
    ]],
	true
)

--vim.api.nvim_exec( -- todo - seperate movefmt to show error message
--	[[  augroup FormatAutogroup
--        autocmd!
--        autocmd BufWritePost *.move FormatWrite
--    augroup END
--    ]],
--	true
--)
