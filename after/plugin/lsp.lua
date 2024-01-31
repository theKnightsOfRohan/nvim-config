if vim.g.vscode then
    return
end

local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

require("mason").setup({
    ui = {
        border = "rounded",
    },
})
require("mason-lspconfig").setup({
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require("cmp")

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-CR>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
    },
})

local telescope_builtin = require("telescope.builtin")

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)

    vim.keymap.set("n", "gr", function()
        telescope_builtin.lsp_references()
    end, opts)

    vim.keymap.set("n", "<leader>i", function()
        vim.lsp.buf.hover()
    end, opts)

    vim.keymap.set("n", "<leader>r", function()
        local cmd_id
        cmd_id = vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
            callback = function()
                local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
                vim.api.nvim_feedkeys(key, "c", false)
                vim.api.nvim_feedkeys("0", "n", false)
                cmd_id = nil
                return true
            end,
        })
        vim.lsp.buf.rename()
        vim.defer_fn(function()
            if cmd_id then
                vim.api.nvim_del_autocmd(cmd_id)
            end
        end, 500)
    end, opts)

    lsp_zero.buffer_autoformat() -- On write
end)

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.diagnostic.config({
    signs = false,
})

local root_markers = { ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

lsp_zero.setup({
    root_dir = root_dir,
})
