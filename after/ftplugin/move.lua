-- Configurations for the Move language server

-- install aptos move analyzer - cargo install --git https://github.com/movebit/move --branch feature/aptos_move_analyzer aptos-move-analyzer
-- (last working version: 0.3.0)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "'d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", ";d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

vim.lsp.start({
	name = "aptos-move-analyzer",
	cmd = { "aptos-move-analyzer" },
	filetypes = { "move" },
	root_dir = vim.fs.dirname(vim.fs.find({ "Move.toml" }, { upward = true })[1]),
	single_file_support = true,
	on_attach = on_attach,
	capabilities = capabilities,
})
