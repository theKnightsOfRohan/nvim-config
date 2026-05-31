---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	-- event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>pv",
			mode = "n",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	opts = {
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
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- mark netrw as loaded so it's not loaded at all.
		--
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		vim.g.loaded_netrwPlugin = 1
	end,
}
