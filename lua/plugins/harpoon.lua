return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
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
    end,
}
