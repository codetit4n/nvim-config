-- Configurations for the Move language server

-- install aptos move analyzer - cargo install --git https://github.com/movebit/move --branch feature/aptos_move_analyzer aptos-move-analyzer
-- (last properly working version: 0.3.0)

vim.lsp.start({
	name = "aptos-move-analyzer",
	cmd = { "aptos-move-analyzer" },
	filetypes = { "move" },
	single_file_support = true,
	capabilities = Capabilities,
	root_dir = vim.fs.dirname(vim.fs.find({ "Move.toml" }, { upward = true })[1]),
})
