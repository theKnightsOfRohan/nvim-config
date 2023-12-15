if vim.g.vscode then
    return
end

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff)
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
vim.keymap.set("n", "<leader>gB", ":Git branch")
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>")
