-- Safely require gitsigns.
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    vim.notify("There have been issues in requiring gitsigns!")
    return
end

-- GitSigns settings.
gitsigns.setup {
    signs = {
        -- Icons that will show on the side bar for lines of code.
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "X", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "X", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },

    -- UI Settings.
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,

    -- Settings for tracking changes.
    watch_gitdir = { interval = 1000, follow_files = true, },
    attach_to_untracked = true,

    -- Settings for whether to show git blame and how.
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false
    },
    current_line_blame_formatter_opts = { relative_time = false },

    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,

    preview_config = { border = "single", style = "minimal", relative = "cursor", row = 0, col = 1 },
    yadm = { enable = false }
}

