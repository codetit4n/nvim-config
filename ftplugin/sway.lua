-- Sway language server
-- Install sway language server - https://fuel.network

vim.lsp.start({
	name = "forc-lsp",
	cmd = { "forc-lsp" },
	filetypes = { "sway" },
	single_file_support = true,
})
