-- Vim command remaps
vim.g.mapleader = ";"
vim.api.nvim_command('command! Q quitall')

-- Normal mode QOL

-- Insert mode QOL
local wrappers = { '""', "''", "``", "()", "[]", "{}" }

for _, wrapper in ipairs(wrappers) do
    local left = wrapper:sub(1, 1)
    local right = wrapper:sub(2, 2)

    vim.api.nvim_set_keymap(
        'i',
        left,
        wrapper .. '<Left>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        'i',
        left .. '<CR>',
        left .. '<CR>' .. right .. '<Esc>O',
        { noremap = true }
    )
end

-- Visual mode QOL

-- General settings
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.fillchars = { eob = " " }
vim.opt.timeoutlen = 500
