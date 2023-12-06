if vim.g.vscode then
    -- Add vscode-specific config
else
    -- Add nvim-specific config
    require('normal')
    require('colorbuddy').colorscheme('onebuddy')
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
