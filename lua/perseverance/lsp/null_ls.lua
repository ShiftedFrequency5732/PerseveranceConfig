-- Safely require null-ls.
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    vim.notify("There have been issues in requiring null-ls!")
    return
end

-- Access built in formatters/diagnostics lua scripts in null-ls.
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- General null_ls settings.
null_ls.setup {
    debug = false,
    sources = {
        diagnostics.flake8,
        formatting.black.with { extra_args = { "--fast" } },
        diagnostics.cpplint,
        formatting.clang_format,
        formatting.stylua
    }
}

