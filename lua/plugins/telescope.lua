return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local telescope_builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", telescope_builtin.find_files, {})
        vim.keymap.set("n", "<leader>ps", telescope_builtin.live_grep, {})
        vim.keymap.set("n", "<leader>H", telescope_builtin.help_tags, {})
    end,
}
