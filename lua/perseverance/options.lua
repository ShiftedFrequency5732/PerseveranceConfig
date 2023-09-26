-- NeoVim settings table.
local options = {
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    wrap = false,
    number = true,
    relativenumber = true,
    mouse = 'a',
    cursorline = true,
    termguicolors = true,
    hlsearch = true,
    ignorecase = true,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    encoding = "UTF-8",
    fileencoding = "UTF-8",
    clipboard = "unnamedplus",
    guifont = "ComicShannsMono Nerd Font:h15",
    swapfile = true,
    undofile = true,
    backup = false
}

-- Applying the settings table.
for key, value in pairs(options) do
    vim.opt[key] = value
end

