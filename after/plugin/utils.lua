-- Create a user command to call the function
vim.api.nvim_create_user_command('OpenInBrowser', function()
    vim.api.nvim_command('silent !open ' .. vim.fn.expand('%:p'))
end, {})
