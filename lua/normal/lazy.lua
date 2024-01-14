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

-- Treesitter basically is a code tokenizer
-- Colorbuddy is a color scheme helper
-- Onebuddy is a color scheme
-- Lualine makes my statusline look nice
-- Nvim-web-devicons is for icons
-- Noice improves the UI so I don't constantly look down
-- Nui is a UI library
-- Nvim-notify is for notification popups
-- Toggleterm is for creating persistent terminal buffers easily
local ui = {
    "nvim-treesitter/nvim-treesitter",
    "tjdevries/colorbuddy.vim",
    "Th3Whit3Wolf/onebuddy",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/noice.nvim",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "akinsho/toggleterm.nvim",
}

-- Lsp-Zero is the base for my LSP setup
-- The rest of these plugins are what lsp-zero configures
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
}

-- Dap is the debugger
-- Right now it doesn't work :P
local dap = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
}

-- Telescope is a fuzzy finder, so it's less exact
-- Harpoon is a bookmarking plugin
-- Nvim-tree is a file explorer
local navigation = {
    "nvim-telescope/telescope.nvim",
    "theprimeagen/harpoon",
    "nvim-tree/nvim-tree.lua",
}

-- Signify is for git diffing on the statusline
-- Undotree is for visualizing the tree of changes in an nvim session
-- Lazygit is a git client (not nvim specific, this is just integration)
local git = {
    "mhinz/vim-signify",
    "mbbill/undotree",
    "kdheepak/lazygit.nvim",
}

-- Autoclose is for automatically closing brackets
-- Comment is for commenting out lines with a keybind
local input = {
    "m4xshen/autoclose.nvim",
    "numToStr/Comment.nvim",
}

-- Vim-be-good is a vim tutor
-- Copilot is, well, GitHub Copilot
-- Plenary is a dependency for a lot of plugins (Think of it as a standard library)
-- Glow is a markdown previewer
-- Trouble displays a list of errors and warnings from the LSP
local misc = {
    "ThePrimeagen/vim-be-good",
    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
    "ellisonleao/glow.nvim",
    "folke/trouble.nvim",
}

local dev = {
    dir = "~/Documents/GitHub/harpoon_commander.nvim",
}

-- Setup lazy.nvim
require("lazy").setup({
    -- Add plugins here
    ui,
    lsp,
    dap,
    navigation,
    git,
    input,
    misc,
    dev,
})
