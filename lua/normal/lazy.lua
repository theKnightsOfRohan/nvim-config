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

local ui = {
    "nvim-treesitter/nvim-treesitter",
    "tjdevries/colorbuddy.vim",
    "Th3Whit3Wolf/onebuddy",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    --[[ "folke/noice.nvim",
    "MunifTanjim/nui.nvim", ]]
    "rcarriga/nvim-notify",
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
}

local git = {
    "mhinz/vim-signify",
    "tpope/vim-fugitive",
    "mbbill/undotree",
}

local input = {
    "m4xshen/autoclose.nvim",
    "numToStr/Comment.nvim",
}

local misc = {
    "ThePrimeagen/vim-be-good",
    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
}

-- Setup lazy.nvim
require("lazy").setup({
    -- Add plugins here
    ui,
    lsp,
    navigation,
    git,
    input,
    misc,
})
