if not vim.g.vscode then
    -- disable netrw to avoid conflicts
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    })

    vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen);
    vim.keymap.set("n", "<leader>cv", vim.cmd.NvimTreeClose);

    -- requires arg, so can't use above format
    vim.api.nvim_set_keymap('n', '<leader>f', ':wincmd l<CR>', { noremap = true })
end
