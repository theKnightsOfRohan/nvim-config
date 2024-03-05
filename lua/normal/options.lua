-- Vim command remaps
vim.g.mapleader = ";"
vim.api.nvim_command("command! Q quitall")

-- Window navigation
vim.keymap.set("n", "<S-Up>", function()
    vim.cmd("wincmd k")
end)
vim.keymap.set("n", "<S-Down>", function()
    vim.cmd("wincmd j")
end)
vim.keymap.set("n", "<S-Left>", function()
    vim.cmd("wincmd h")
end)
vim.keymap.set("n", "<S-Right>", function()
    vim.cmd("wincmd l")
end)

-- Copy highlighted selection
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true })

-- Quick save
vim.keymap.set("n", "<leader>s", function()
    vim.lsp.buf.format()
    vim.cmd.write()
end, { noremap = true })

-- Visual mode bracket surround
-- I need this because the autoclose.nvim plugin is only for insert mode
-- It can sometimes be a little buggy, but that's what formatters are for
local surrounders = {
    ["("] = ")",
    ["["] = "]",
    ["'"] = "'",
    ['"'] = '"',
    ["`"] = "`",
    ["<"] = ">",
}

for open, close in pairs(surrounders) do
    vim.api.nvim_set_keymap("v", open, "c" .. open .. close .. "<Esc>hp", { noremap = true })
end

vim.api.nvim_set_keymap("v", "{", "c" .. "{}<Left><CR><Up><Esc>o<Esc>p>>h", { noremap = true })

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = " " }
vim.opt.scrolloff = 20
vim.opt.timeoutlen = 500
vim.opt.updatetime = 100
