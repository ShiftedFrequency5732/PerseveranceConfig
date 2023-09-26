-- Path where lazy.nvim should be installed.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    -- Install lazy.nvim through git in case it is not installed.
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

if not vim.loop.fs_stat(lazypath) then
    -- In case lazy.nvim still isn't installed, report it to the user.
    vim.notify("Failed to install lazy.nvim, make sure you have available internet connection!")
    return
end

-- Append lazy.nvim path to nvim.
vim.opt.rtp:prepend(lazypath)


-- Additionally, make sure you have the following installed in your system: git, nodejs, ripgrep, lazygit, nerdfont.
local plugins = {
    -- Let the lazy.nvim manage itself.
    "folke/lazy.nvim",

    -- Colorschemes.
    "folke/tokyonight.nvim",
    "lunarvim/darkplus.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- cmp plugins for auto-completion.
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets plugins.
    { "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
    "rafamadriz/friendly-snippets",

    -- LSP plugins for cmp.
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("perseverance.lsp.null_ls")
        end
    },

    -- For syntax highlighting.
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- For highlighting indentations.
    { "lukas-reineke/indent-blankline.nvim" },

    -- For automatically closing brackets.
    { 'windwp/nvim-autopairs', event = "InsertEnter", opts = {} },

    -- For fuzzy search.
    { 'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- For git decorations on the side.
    'lewis6991/gitsigns.nvim',

    -- For file explorer.
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup {}
        end
    },

    -- For showing buffers in tabs.
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

    -- For closing last buffer without closing neovim.
    'moll/vim-bbye',

    -- For terminal inside neovim.
    {'akinsho/toggleterm.nvim', version = "*", config = true },

    -- For pretty status-line.
    {'nvim-lualine/lualine.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

    -- For pretty greeter.
    { 'goolord/alpha-nvim', event = "VimEnter", dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- For showing shortcuts.
    {
        "folke/which-key.nvim", event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
}


-- Safely require lazy.nvim.
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    vim.notify("There have been issues in setting up lazy.nvim")
    return
end

-- Setup lazy.nvim.
lazy.setup(plugins)

