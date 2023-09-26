-- Helper function for concatinating tables.
local function glue_tables(t1, t2)
   for i = 1, #t2 do
      t1[#t1 + 1] = t2[i]
   end
   return t1
end


-- Things that mason should automatically install.
-- Linters can be configured in nvim-data/mason/packages/LINTER_NAME/venv/Lib/site_packages/*.
local servers = { "lua_ls", "jsonls", "pyright", "clangd" }
local formatters = { "black", "clang-format", "stylua" }
local linters = { "flake8", "cpplint" }


-- Mason general settings.
local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4
}

-- Setup mason with the settings above.
require("mason").setup(settings)

-- Make sure the stated servers in the table are installed automatically.
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})

-- Make sure that stated linters/formatters are installed automatically.
require("mason-null-ls").setup({
    ensure_installed = glue_tables(formatters, linters)
})


-- Safely require lspconfig.
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("There have been issues in requiring lspconfig!")
    return
end

-- Declare opts table.
local opts = {}

for _, server in pairs(servers) do
    -- Prepare for each LSP server options table.
    opts = {
        on_attach = require("perseverance.lsp.handlers").on_attach,
        capabilities = require("perseverance.lsp.handlers").capabilities
    }

    -- Try finding settings for each LSP server in settings directory.
    server = vim.split(server, "@")[1]
    local require_ok, conf_opts = pcall(require, "perseverance.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    -- Tell LSP how server should be configured.
    lspconfig[server].setup(opts)
end

