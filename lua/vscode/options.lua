-- Vim command remaps
vim.g.mapleader = ";"

-- Copy and paste in different modes
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pi', { noremap = true })

-- Visual mode bracket surround
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
    vim.api.nvim_set_keymap('v', k, 'c' .. k .. v .. '<Esc>hpi', { noremap = true })
end

-- General settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = " " }
vim.opt.timeoutlen = 500
vim.opt.updatetime = 100
