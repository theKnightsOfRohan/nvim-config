-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local colorscheme = {
    "nvim-treesitter/nvim-treesitter",
    "tjdevries/colorbuddy.vim",
    "Th3Whit3Wolf/onebuddy",
    "nvim-lualine/lualine.nvim",
}

local lsp = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
}

local navigation = {
    "nvim-telescope/telescope.nvim",
    "theprimeagen/harpoon",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "s1n7ax/nvim-terminal",
}

local git = {
    "mhinz/vim-signify",
    "tpope/vim-fugitive",
    "mbbill/undotree",
}

local misc = {
    "ThePrimeagen/vim-be-good",
    "github/copilot.vim",
    "m4xshen/autoclose.nvim",
    "nvim-lua/plenary.nvim",
    "numToStr/Comment.nvim",
}

-- Setup lazy.nvim
require("lazy").setup({
    -- Add plugins here
    colorscheme,
    lsp,
    navigation,
    git,
    misc,
})
