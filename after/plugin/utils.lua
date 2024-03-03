if vim.g.vscode then
    return
end

-- Create a user command to call the function
vim.api.nvim_create_user_command("Preview", function()
    vim.api.nvim_command("silent !open " .. vim.fn.expand("%:p"))
end, {})

require("glow").setup({
    glow_path = "/opt/homebrew/bin/glow",
    border = "rounded", -- floating window border config
    pager = false,
    width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size
    height_ratio = 0.7,
})

-- TROUBLE

vim.keymap.set("n", "<leader>xx", function()
    require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xf", function()
    require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
    require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
    require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "gR", function()
    require("trouble").toggle("lsp_references")
end)

-- CSVLENS

require("csvlens").setup({})

-- AUTO-SESSION

require("auto-session").setup({})
