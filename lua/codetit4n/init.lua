require("codetit4n.set")
require("codetit4n.remaps")
require("codetit4n.lazy_init")
require("codetit4n.diagnostics")

local augroup = vim.api.nvim_create_augroup
local codetit4n_group = augroup("codetit4n", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		move = "move",
	},
})

vim.filetype.add({
	extension = {
		sw = "sway",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = codetit4n_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

local function goto_next_error()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.ERROR,
	})
end

local function goto_prev_error()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.ERROR,
	})
end

autocmd("LspAttach", {
	group = codetit4n_group,
	callback = function(e)
		local opts = { buffer = e.buf }
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
		vim.keymap.set("n", "'d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", ";d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "'e", goto_next_error, opts)
		vim.keymap.set("n", ";e", goto_prev_error, opts)
	end,
})

local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<up>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<down>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

Capabilities =
	vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

-- Force all floating previews to have rounded border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" }) -- or set a custom transparency groupinit
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" }) -- match border to your theme

-- Completion menu highlights
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1f2335", fg = "#c0caf5" }) -- Background of the menu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#414868", fg = "#ffffff", bold = true }) -- Selected item
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#16161e" }) -- Scrollbar background
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#555555" }) -- Scrollbar thumb
