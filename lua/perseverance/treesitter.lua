-- Safely require nvim-treesitter.configs.
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("There have been issues in requiring nvim-treesitter.configs!")
    return
end

-- Settings for treesitter.
configs.setup {
    ensure_installed = { "lua", "c", "cpp", "python", "bash", "cmake" },
    sync_install = false,
    ignore_install = { "" },
    autopairs = { enable = true },
    highlight = { enable = true, disable = { "" }, additional_vim_regex_highlighting = true },
    indent = { enable = true, disable = { "yaml" } },
}

