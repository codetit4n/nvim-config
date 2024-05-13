-- Sway language server
-- Install sway language server - https://fuel.network

vim.lsp.start({
	name = "forc-lsp",
	cmd = { "forc-lsp" },
	filetypes = { "sway" },
	single_file_support = true,
	capabilities = Capabilities,
	root_dir = vim.fs.dirname(vim.fs.find({ "Forc.toml", "Cargo.toml" }, { upward = true })[1]),
})
