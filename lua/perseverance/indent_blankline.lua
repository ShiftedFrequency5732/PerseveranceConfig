local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    vim.notify("There have been issues in requiring indent_blankline!")
    return
end

indent_blankline.setup {
    show_current_context = true,
    show_current_context_start = true
}

