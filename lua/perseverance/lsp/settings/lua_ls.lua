return {
    settings = {
        Lua = {
            -- Treat vim as built-in global object, useful for writing neovim configuration.
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                }
            }
        }
    }
}

