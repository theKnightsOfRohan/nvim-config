local function nvim_setup()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
end

return {
    nvim_setup = nvim_setup,
}
