if vim.g.vscode then
    return
end

vim.keymap.set("n", "<leader>g", vim.cmd.LazyGit)
