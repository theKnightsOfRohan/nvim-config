-- Vim command remaps
vim.g.mapleader = ";"
vim.api.nvim_command('command! Q quitall')

-- Normal mode QOL

-- Insert mode QOL

-- Visual mode QOL
local surrounders = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ["'"] = "'",
    ['"'] = '"',
    ["`"] = "`",
    ["<"] = ">",
}

for k, v in pairs(surrounders) do
    vim.api.nvim_set_keymap('v', k, 'c' .. k .. v .. '<Esc>hpa', { noremap = true })
end

-- General settings
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = " " }
vim.opt.timeoutlen = 500
