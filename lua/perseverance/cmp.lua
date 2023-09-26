-- Safely try to require cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("There have been issues in requiring cmp!")
    return
end

-- Safely try to require luasnip.
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    vim.notify("There have been issues in requiring luasnip!")
    return
end

-- Allow lazy-loading plugins from vs-code for luasnip.
require("luasnip/loaders/from_vscode").lazy_load()

-- Helps supertab work better.
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


-- Icons for completion item in intellisense.
local kind_icons = {
    Text = "󰊄",
    Method = "m",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "󰌆",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "󰉺"
}


cmp.setup {
    snippet = {
        expand = function(args)
            -- Use luasnip for snipping engine.
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = {
        -- Shortcuts to scroll through completion menu.
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),

        -- Shortcuts to scroll through docs for completion menu item. 
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

        -- Shortcut to pull up the completion without typing.
        ["<C-A>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- Shortcut to exit completion menu.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },

        -- Accept currently selected item. 
        ["<CR>"] = cmp.mapping.confirm { select = true },

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                -- If completion menu is shown, then select next item.
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                -- Default behavior.
                fallback()
            else
                -- Default behavior.
                fallback()
            end
        end, { "i", "s" }),

        -- Shift tab is similar to regular tab.
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" })
    },

    formatting = {
        -- Order of fields in the completion menu.
        fields = { "kind", "abbr", "menu" },

        format = function(entry, vim_item)
            -- Format string for kind icon.
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

            -- Text that shows for what the completion is for.
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[NVIM_LUA]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]"
            })

            [entry.source.name]
            return vim_item
        end
    },

    sources = {
        -- The order of source items will determine the order of items in completion menu.
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" }
    },

    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },

    window = {
        -- Use bordered menu.
        documentation = cmp.config.window.bordered()
    }
}
