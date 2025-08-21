vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = "rounded",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "!",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "",
      [vim.diagnostic.severity.INFO]  = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    },
  },
})

-- Highlight groups (you can theme them however you want)
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff0000" })   -- red
vim.api.nvim_set_hl(0, "DiagnosticSignWarn",  { fg = "#FFB86C" })   -- soft orange
vim.api.nvim_set_hl(0, "DiagnosticSignHint",  { fg = "#98C379" })   -- soft green
vim.api.nvim_set_hl(0, "DiagnosticSignInfo",  { fg = "#61AFEF" })   -- blue
