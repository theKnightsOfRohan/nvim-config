if vim.g.vscode then
    return
end

local lsp = require('lsp-zero')
local jdtls = require('jdtls')

lsp.preset("recommended")

local root_markers = { ".gradle", "gradlew", ".git" }
local root_dir = jdtls.setup.find_root(root_markers)

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-CR>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
    },
})

local telescope_builtin = require('telescope.builtin')

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() telescope_builtin.lsp_references() end, opts)
    vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.hover() end, opts)
    lsp.buffer_autoformat() -- On write
end)

vim.diagnostic.config({
    signs = false,
})

lsp.setup({
    root_dir = root_dir,
})
