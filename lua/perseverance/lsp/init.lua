-- Safely require lspconfig.
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("There have been issues in requiring lspconfig!")
    return
end

-- Require mason installer for language servers.
require("perseverance.lsp.mason")

-- Require null-ls which is used for code linting/formatting.
require("perseverance.lsp.null_ls")

