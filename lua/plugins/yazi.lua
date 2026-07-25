vim.pack.add({
	gh("mikavilpas/yazi.nvim"),
	gh("nvim-lua/plenary.nvim"),
})

vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
	-- if you want to open yazi instead of netrw, see below for more info
	open_for_directories = false,
	keymaps = {
		show_help = "<f1>",
	},
	floating_window_scaling_factor = 1,
	yazi_floating_window_border = "none",
	hooks = {
		before_opening_window = function(opts)
			local cur_win = vim.api.nvim_get_current_win()
			local width = vim.api.nvim_win_get_width(cur_win)
			local height = vim.api.nvim_win_get_height(cur_win)
			local row, col = unpack(vim.api.nvim_win_get_position(cur_win))
			opts.width = width - 2
			opts.height = height + 2
			opts.row = row - 1
			opts.col = col
		end,
	},
})

vim.keymap.set("n", "<leader>pv", vim.cmd.Yazi, { desc = "Open yazi at the current file" })
