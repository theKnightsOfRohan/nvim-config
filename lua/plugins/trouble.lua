return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>xx",
			function()
				vim.cmd("Trouble diagnostics toggle")
				vim.cmd("Trouble diagnostics focus")
			end,
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xq",
			function()
				vim.cmd("Trouble qflist toggle")
				vim.cmd("Trouble qflist focus")
			end,
			desc = "Quickfix List (Trouble)",
		},
		{
			"gr",
			function()
				vim.fn.settagstack(
					vim.fn.win_getid(0),
					{ items = { { tagname = vim.fn.expand("<cword>"), from = vim.fn.getpos(".") } } },
					"t"
				)
				vim.cmd("Trouble lsp_references toggle")
				vim.cmd("Trouble lsp_references focus")
			end,
			desc = "Lsp References (Trouble)",
		},
		{
			"gi",
			function()
				vim.fn.settagstack(
					vim.fn.win_getid(0),
					{ items = { { tagname = vim.fn.expand("<cword>"), from = vim.fn.getpos(".") } } },
					"t"
				)
				vim.cmd("Trouble lsp_implementations toggle")
				vim.cmd("Trouble lsp_implementations focus")
			end,
			desc = "Lsp Implementations (Trouble)",
		},
		{
			"gd",
			function()
				vim.fn.settagstack(
					vim.fn.win_getid(0),
					{ items = { { tagname = vim.fn.expand("<cword>"), from = vim.fn.getpos(".") } } },
					"t"
				)
				vim.cmd("Trouble lsp_definitions toggle")
				vim.cmd("Trouble lsp_definitions focus")
			end,
			desc = "Lsp Definitions (Trouble)",
		},
		{
			"gb",
			function()
				vim.cmd.pop()
			end,
			desc = "Lsp Definitions (Trouble)",
		},
	},
	opts = {},
}
