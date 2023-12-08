if not vim.g.vscode then
    require("autoclose").setup({
        options = {
            disable_command_mode = true,
        },
    })
end
