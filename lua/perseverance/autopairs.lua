-- Safely require nvim-autopairs.completion.cmp.
local status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_ok then
    vim.notify("There have been issues in requiring nvim-autopairs!")
    return
end

-- Safely require cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("There have been issues in requiring cmp!")
    return
end

-- When function/method is selected from LSP through cmp, add brackets.
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

