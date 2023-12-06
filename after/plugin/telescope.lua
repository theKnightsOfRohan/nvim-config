local function nvim_setup()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
    vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({
            search = vim.fn.input("Grep > ")
        })
    end)
end

return {
    nvim_setup = nvim_setup,
}
