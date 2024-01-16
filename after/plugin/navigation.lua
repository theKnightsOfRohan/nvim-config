if vim.g.vscode then
    return
end

-- HARPOON

local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
            return vim.loop.cwd()
        end,
    },
})

vim.keymap.set("n", "<leader>h", function()
    harpoon:list():append()
end)
vim.keymap.set("n", "<C-h>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Yes, yes, I'm on qwerty, so sue me
-- TODO: Figure out how to turn this into numbers
vim.keymap.set("n", "<C-q>", function()
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-w>", function()
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-e>", function()
    harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-r>", function()
    harpoon:list():select(4)
end)

-- UNDO TREE

vim.keymap.set("n", "<leader>u", function()
    vim.cmd("UndotreeToggle")
    vim.cmd("UndotreeFocus")
end)

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
        -- git_ignored = false,
    },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.api.nvim_create_user_command("ToggleTreeIgnored", function()
    require("nvim-tree.api").tree.toggle_gitignore_filter()
end, {})

-- TELESCOPE

local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", telescope_builtin.live_grep, {})
