-- Basic neovim options.
require("perseverance.options")
require("perseverance.keymaps")
require("perseverance.neovide")

-- Package manager config.
require("perseverance.plugins")

-- Neovim options that depend on some plugins.
require("perseverance.colorschemes")

-- Coding related plugins configuration.
require("perseverance.cmp")
require("perseverance.lsp")
require("perseverance.autopairs")
require("perseverance.treesitter")
require("perseverance.indent_blankline")
require("perseverance.gitsigns")

-- Quality of life plugins.
require("perseverance.telescope")
require("perseverance.nvimtree")
require("perseverance.bufferline")
require("perseverance.toggleterm")
require("perseverance.lualine")
require("perseverance.alpha")
require("perseverance.whichkey")

