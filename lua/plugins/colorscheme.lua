vim.pack.add({
	gh("theKnightsOfRohan/onedark.nvim"),
	-- "olimorris/onedarkpro.nvim",
})

-- require("onedarkpro").setup({
-- 	options = {
-- 		transparency = true,
-- 	},
-- 	highlights = {
-- 		Type = {
-- 			fg = { onedark = "${yellow}" },
-- 		},
-- 	},
-- })

vim.cmd("colorscheme onedark")
vim.hl.priorities.semantic_tokens = 110
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
