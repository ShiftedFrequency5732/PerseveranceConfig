-- Name of the colorscheme that you want to apply.
local colorscheme_name = "darkplus"

-- Try to safely apply the colorscheme through vimscript.
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme_name)
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme_name .. " hasn't been found!")
    return
end

