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
    "joshdick/onedark.vim",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/noice.nvim",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "akinsho/toggleterm.nvim",
}

local lsp = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "VonHeikemen/lsp-zero.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-jdtls",
    "apple/pkl-neovim",
}

local dap = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
}

local navigation = {
    "nvim-telescope/telescope.nvim",
    "theprimeagen/harpoon",
    "simonmclean/triptych.nvim",
}

local git = {
    "mhinz/vim-signify",
    "mbbill/undotree",
    "kdheepak/lazygit.nvim",
}

local input = {
    "m4xshen/autoclose.nvim",
    "numToStr/Comment.nvim",
    "github/copilot.vim",
}

local misc = {
    "ThePrimeagen/vim-be-good",
    "nvim-lua/plenary.nvim",
    "ellisonleao/glow.nvim",
    "theKnightsOfRohan/csvlens.nvim",
    "rmagatti/auto-session",
}

local dev = {
    -- dir = "~/Documents/GitHub/csvlens.nvim",
    -- dir = "~/Documents/GitHub/harpoon",
    -- dir = "~/Documents/GitHub/triptych.nvim"
    -- dir = "~/Documents/GitHub/pkl-neovim",
}

require("lazy").setup({
    ui,
    lsp,
    dap,
    navigation,
    git,
    input,
    misc,
    dev,
}, {
    ui = {
        border = "rounded",
    },
})
