vim.pack.add({
	gh("mbbill/undotree"),
})

vim.keymap.set("n", "<leader>u", function()
	vim.cmd.UndotreeToggle()
	vim.cmd.UndotreeFocus()
end)
