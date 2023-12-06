if vim.g.vscode then
    return
else
    require("after.plugin.autoclose").nvim_setup()
    require("after.plugin.colors").nvim_setup()
    require("after.plugin.filetree").nvim_setup()
    require("after.plugin.fugitive").nvim_setup()
    require("after.plugin.harpoon").nvim_setup()
    require("after.plugin.lsp").nvim_setup()
    require("after.plugin.telescope").nvim_setup()
    require("after.plugin.treesitter").nvim_setup()
    require("after.plugin.undotree").nvim_setup()
end
