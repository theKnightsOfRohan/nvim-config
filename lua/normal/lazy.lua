-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    -- Add plugins here
    "ThePrimeagen/vim-be-good",
    "tomasiser/vim-code-dark",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "github/copilot.vim",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "tjdevries/colorbuddy.vim",
    "Th3Whit3Wolf/onebuddy",
    "m4xshen/autoclose.nvim",
})
