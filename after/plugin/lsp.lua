if not vim.g.vscode then
    local lsp = require('lsp-zero')

    lsp.preset("recommended")

    require('mason').setup({})
    require('mason-lspconfig').setup({
        handlers = {
            lsp.default_setup,
        },
    })

    local cmp = require('cmp')

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-CR>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        })
    })

    lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>s", function()
            vim.cmd('LspZeroFormat')
            vim.cmd('w')
        end, opts)
    end)

    lsp.setup()
end
