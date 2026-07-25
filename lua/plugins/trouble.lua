vim.pack.add({
	gh "nvim-tree/nvim-web-devicons",
	gh "folke/trouble.nvim",
})

require("trouble").setup()

vim.keymap.set("n", "<leader>xx", function()
	vim.cmd("Trouble diagnostics toggle")
	vim.cmd("Trouble diagnostics focus")
end, { desc = "Diagnostics (Trouble)" })

vim.keymap.set("n", "<leader>xq", function()
	vim.cmd("Trouble qflist toggle")
	vim.cmd("Trouble qflist focus")
end, { desc = "Quickfix List (Trouble)" })

vim.keymap.set("n", "gr", function()
	vim.fn.settagstack(
		vim.fn.win_getid(0),
		{ items = { { tagname = vim.fn.expand("<cword>"), from = vim.fn.getpos(".") } } },
		"t"
	)
	vim.cmd("Trouble lsp_references toggle")
	vim.cmd("Trouble lsp_references focus")
end, { desc = "Lsp References (Trouble)" })

vim.keymap.set("n", "gi", function()
	vim.fn.settagstack(
		vim.fn.win_getid(0),
		{ items = { { tagname = vim.fn.expand("<cword>"), from = vim.fn.getpos(".") } } },
		"t"
	)
	vim.cmd("Trouble lsp_implementations toggle")
	vim.cmd("Trouble lsp_implementations focus")
end, { desc = "Lsp Implementations (Trouble)" })

vim.keymap.set("n", "gd", function()
	vim.fn.settagstack(
		vim.fn.win_getid(0),
		{ items = { { tagname = vim.fn.expand("<cword>"), from = vim.fn.getpos(".") } } },
		"t"
	)
	vim.cmd("Trouble lsp_definitions toggle")
	vim.cmd("Trouble lsp_definitions focus")
end, { desc = "Lsp Definitions (Trouble)" })

vim.keymap.set("n", "gb", function()
	vim.cmd.pop()
end, { desc = "Pop Tagstack" })
