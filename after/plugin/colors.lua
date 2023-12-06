local function nvim_setup()
    require('colorbuddy').colorscheme('onebuddy')

    -- Makes the background transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    nvim_setup = nvim_setup,
}
