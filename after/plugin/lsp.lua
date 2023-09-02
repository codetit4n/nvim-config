local lsp = require("lsp-zero").preset({})
local lspconfig = require("lspconfig")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"html",
	"cssls",
	"lua_ls",
	"marksman",
	"yamlls",
	"jedi_language_server",
	"clangd",
	"docker_compose_language_service",
	"dockerls",
	"solidity_ls_nomicfoundation",
	"csharp_ls",
	"jdtls",
	"move_analyzer",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<down>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<up>"] = cmp.mapping.select_prev_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({ select = false }),
}

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

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
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
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

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"rustup",
		"run",
		"stable",
		"rust-analyzer",
	},
})

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach, -- for keybinds
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jedi_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	single_file = true,
})

-- configure marksman server
lspconfig["marksman"].setup({
	capabilities = capabilities,
	on_attach = on_attach, -- for keybinds
})

lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach, -- for keybinds
})

-- configure c++ language server
local capabilitiesClangd = vim.lsp.protocol.make_client_capabilities()
capabilitiesClangd.offsetEncoding = { "utf-16" }
lspconfig["clangd"].setup({
	capabilities = capabilitiesClangd,
	on_attach = on_attach,
	disable_filetype = { "cs" },
})

lspconfig["csharp_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	single_file = true,
})

-- configure docker-compose language server
lspconfig["docker_compose_language_service"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "yaml", "yml" },
	root_dir = lspconfig.util.root_pattern("docker-compose.yml", "docker-compose.yaml"),
	single_file_support = true,
})

-- configure dockerfile language server
lspconfig["dockerls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "Dockerfile", "dockerfile" },
	root_dir = lspconfig.util.root_pattern("Dockerfile", "dockerfile"),
	single_file_support = true,
})

-- configure solidity language server
lspconfig["solidity_ls_nomicfoundation"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure java language server
lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure move_analyzer language server
lspconfig["move_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.setup()
