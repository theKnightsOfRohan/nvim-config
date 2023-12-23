if vim.g.vscode then
    return
end

-- This used to be a lot more complicated, but I've since moved to lazygit
-- Keeping this here for organization's sake
vim.keymap.set("n", "<leader>g", vim.cmd.LazyGit)
