--[[ if not vim.g.vscode then
    require("normal")
end
]]
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

require("options")
require("lazy").setup("plugins",
    {
        ui = {
            border = "rounded",
        },
    }
)
