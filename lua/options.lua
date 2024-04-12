-- Vim command remaps
vim.g.mapleader = ";"

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
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.g.netrw_banner = 0

vim.api.nvim_command("command! Q quitall")
vim.api.nvim_set_keymap("i", ";;", "<Esc>$a;", { noremap = true, silent = true })

-- Window navigation
for _, dir in ipairs({ "h", "j", "k", "l" }) do
    vim.keymap.set("n", string.format("<C-%s>", dir), function()
        vim.cmd("wincmd " .. dir)
    end)
end

-- Copy highlighted selection to clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Quick save
vim.keymap.set("n", "<leader>s", function()
    vim.cmd.write()
    vim.lsp.buf.format()
    vim.cmd.write()
    vim.diagnostic.show(nil, 0)
end, { noremap = true, silent = true })

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
    vim.api.nvim_set_keymap("v", open, "c" .. open .. close .. "<Esc>hp", { noremap = true, silent = true })
end

vim.api.nvim_set_keymap("v", "{", "c{}<Left><CR><Up><Esc>ph==", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("TextYankPost", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 50,
        })
    end,
})

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_create_user_command("Preview", function()
    vim.api.nvim_command("silent !open " .. vim.fn.expand("%:p"))
end, {})
