if vim.g.vscode then
    return
end

-- HARPOON

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})

vim.keymap.set("n", "<leader>h", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-q>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-e>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-r>", function() harpoon:list():select(4) end)

-- UNDO TREE
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>")

-- NVIM TREE

-- disable netrw to avoid conflicts
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
        dotfiles = false,
        git_ignored = false,
    },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen);
vim.keymap.set("n", "<leader>cv", vim.cmd.NvimTreeClose);

-- requires arg, so can't use above format
vim.api.nvim_set_keymap('n', '<leader>f', ':wincmd l<CR>', { noremap = true })

-- TELESCOPE

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({
        search = vim.fn.input("Grep > ")
    })
end)
