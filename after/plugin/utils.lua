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
    width_ratio = 0.7,  -- maximum width of the Glow window compared to the nvim window size
    height_ratio = 0.7,
})

-- CSVLENS

require("csvlens").setup({
    direction = "float",
    exec_path = "/opt/homebrew/bin/csvlens",
    exec_install_path = vim.fn.stdpath("data") .. "/csvlens.nvim/",
})

-- AUTO-SESSION

require("auto-session").setup({})

-- KEYS
require("keys").setup({
    enable_on_startup = false,
    win_opts = {
        width = 20,
        height = 3,
    }
})
