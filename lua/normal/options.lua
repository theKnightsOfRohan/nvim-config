-- Vim command remaps
vim.g.mapleader = ";"
vim.api.nvim_command('command! Q quitall')

-- Window navigation
-- vim.keymap.set("n", "<leader>m", function() vim.cmd("wincmd " .. string.char(vim.fn.getchar())) end)
vim.keymap.set("n", "<S-Up>", function() vim.cmd("wincmd k") end)
vim.keymap.set("n", "<S-Down>", function() vim.cmd("wincmd j") end)
vim.keymap.set("n", "<S-Left>", function() vim.cmd("wincmd h") end)
vim.keymap.set("n", "<S-Right>", function() vim.cmd("wincmd l") end)

-- Copy and paste in different modes
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pi', { noremap = true })

-- Quick save
vim.keymap.set('n', '<leader>s', vim.cmd.write, { noremap = true })

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
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = " " }
vim.opt.scrolloff = 10
vim.opt.timeoutlen = 500
vim.opt.updatetime = 100
