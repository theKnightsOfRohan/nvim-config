local function nvim_setup()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return {
    nvim_setup = nvim_setup,
}
