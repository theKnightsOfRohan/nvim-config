if not vim.g.vscode then
    require('colorbuddy').colorscheme('onebuddy')

    -- Makes the background transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.opt.termguicolors = true
end
