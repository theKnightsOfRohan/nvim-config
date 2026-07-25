require("options")

require("plugins")

vim.api.nvim_create_user_command("Upkeep", function()
	require("upkeep")()
end, {})
