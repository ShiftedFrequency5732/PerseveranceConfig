-- Safely require bufferline.
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

-- Bufferline settings.
bufferline.setup {
    options = {
        -- Events.
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        -- Icons.
        numbers = "ordinal",
        indicator_icon = "▎",
        buffer_close_icon = '',
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        -- Tab label settings.
        tab_size = 21,
        max_name_length = 30,
        max_prefix_length = 30,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        persist_buffer_sort = true,

        -- Offset bufferline from nvimtree.
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },

        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },

    -- Colorings.
    highlights = {
        fill = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        background = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        buffer_visible = {
           guifg = { attribute = "fg", highlight = "TabLine" },
           guibg = { attribute = "bg", highlight = "TabLine" }
        },

        close_button = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        close_button_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        tab_selected = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" }
        },

        tab = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        tab_close = {
            guifg = { attribute = "fg", highlight = "TabLineSel" },
            guibg = { attribute = "bg", highlight = "Normal" }
        },

        duplicate_selected = {
            guifg = { attribute = "fg", highlight = "TabLineSel" },
            guibg = { attribute = "bg", highlight = "TabLineSel" },
            gui = "italic"
        },

        duplicate_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
            gui = "italic"
        },

        duplicate = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" },
            gui = "italic"
        },

        modified = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        modified_selected = {
            guifg = { attribute = "fg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" }
        },

        modified_visible = {
            guifg = { attribute = "fg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        separator = {
            guifg = { attribute = "bg", highlight = "TabLine" },
            guibg = { attribute = "bg", highlight = "TabLine" }
        },

        separator_selected = {
            guifg = { attribute = "bg", highlight = "Normal" },
            guibg = { attribute = "bg", highlight = "Normal" }
        },

        indicator_selected = {
            guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
            guibg = { attribute = "bg", highlight = "Normal" }
        }
    }
}
