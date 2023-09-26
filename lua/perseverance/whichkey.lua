-- Safely require which-key.
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    vim.notify("There have been issues in requiring which-key!")
    return
end

-- Shortcuts that whichkey provides by default:
-- '   - List of marks
-- "   - Show your registers.
-- z=  - Spelling suggestions.

-- Basic whichkey settings.
local setup = {
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20
        },

        presets = {
            -- Add help to default keybindings.
            operators = false,
            motions = false,
            text_objects = false,
            windows = true,
            nav = true,
            z = true,
            g = true
        },
    },

    icons = {
        -- UI icons.
        breadcrumb = "»",
        separator = "➜",
        group = "+"
    },

    popup_mappings = {
        scroll_down = "<C-j>",
        scroll_up = "<C-k>"
    },

    window = {
        -- UI of window.
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0
    },

    layout = {
        -- Settings of grid on which keymaps will be shown.
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left"
    },

    -- Hide keymaps for which label isn't specified.
    ignore_missing = true,

    -- Hide boilerplate part of mappings.
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

    -- Show help message in command line when popup is visible.
    show_help = true,

    -- Automatically setup triggers.
    triggers = "auto",
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" }
    }
}

-- Options for keymaps.
local opts = {
    -- Mode in which keymaps should work.
    mode = "n",

    -- Key that is used to trigger which-key, the prefix for keymaps.
    prefix = "<leader>",

    -- Settings for generating keymaps.
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true
}

-- Every keymap that starts with leader key will be here instead of in keymaps.lua
local mappings = {
    ["a"] = { ":Alpha<CR>", "Alpha" },
    ["e"] = { ":NvimTreeToggle<CR>", "NvimTree" },
    ["w"] = { ":w!<CR>", "Save" },
    ["q"] = { ":q!<CR>", "Quit" },
    ["c"] = { ":Bdelete!<CR>", "Close Buffer" },
    ["p"] = { ":Lazy<CR>", "Plugin Manager" },

    g = {
        name = "Git",
        j = { ":lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
        k = { ":lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
        p = { ":lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
        r = { ":lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
        s = { ":lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
        u = { ":lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk", },
        R = { ":lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
        l = { ":lua require 'gitsigns'.blame_line()<CR>", "Blame" },
        o = { ":Telescope git_status<CR>", "Open changed file" },
        b = { ":Telescope git_branches<CR>", "Checkout branch" },
        c = { ":Telescope git_commits<CR>", "Checkout commit" },
        d = { ":Gitsigns diffthis HEAD<CR>", "Diff", },
    },

    l = {
        name = "LSP",
        a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        f = { ":lua vim.lsp.buf.format()<CR>", "Format" },
        i = { ":LspInfo<cr>", "Info" },
        r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
        m = { ":Mason<CR>", "LSP Installer"}
    },

    s = {
        name = "Search",
        f = { ":Telescope find_files<CR>", "Find files" },
        o = { ":Telescope oldfiles<CR>", "Open old files" },
        g = { ":Telescope live_grep<CR>", "Live grep" },
        c = { ":Telescope colorscheme<CR>", "Colorscheme" },
        b = { ":Telescope git_branches<CR>", "Checkout branch" },
        r = { ":Telescope registers<CR>", "Registers" },
        k = { ":Telescope keymaps<CR>", "Keymaps" },
        C = { ":Telescope commands<CR>", "Commands" },
    },

    t = {
        name = "Terminal",
        p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Python" },
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "LazyGit" },
        f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" }
    }
}

-- Set the settings for whichkey and mappings. 
which_key.setup(setup)
which_key.register(mappings, opts)

