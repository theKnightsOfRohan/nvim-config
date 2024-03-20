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
    vim.cmd.UndotreeToggle()
    vim.cmd.UndotreeFocus()
end)

-- TRIPTYCH

require("triptych").setup({
    mappings = {
        -- Everything below is buffer-local, meaning it will only apply to Triptych windows
        show_help = "g?",
        jump_to_cwd = ".", -- Pressing again will toggle back
        nav_left = "h",
        nav_right = { "l", "<CR>" },
        delete = "d",
        add = "a",
        copy = "c",
        rename = "r",
        cut = "x",
        paste = "p",
        quit = "q",
        toggle_hidden = "<leader>.",
    },
    extension_mappings = {},
    options = {
        dirs_first = true,
        show_hidden = false,
        line_numbers = {
            enabled = true,
            relative = false,
        },
        file_icons = {
            enabled = true,
            directory_icon = "",
            fallback_file_icon = "",
        },
        column_widths = { 0.25, 0.25, 0.5 }, -- Must add up to 1 after rounding to 2 decimal places
        highlights = {                       -- Highlight groups to use. See `:highlight` or `:h highlight`
            file_names = "NONE",
            directory_names = "NONE",
        },
        syntax_highlighting = { -- Applies to file previews
            enabled = true,
            debounce_ms = 100,
        },
    },
    git_signs = {
        enabled = true,
        signs = {
            add = { text = "+", texthl = "SignifySignAdd" },
            modify = { text = "~", texthl = "SignifySignChange" },
            rename = { text = "r", texthl = "SignifySignChange" },
            untracked = { text = "?", texthl = "SignifySignDelete" },
        },
    },
    diagnostic_signs = {
        enabled = true,
    },
})

vim.keymap.set("n", "<leader>pv", vim.cmd.Triptych, { silent = true })

-- TELESCOPE

local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>ps", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<S-h>", telescope_builtin.help_tags, {})
