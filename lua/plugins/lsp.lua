return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
    },
    event = "VeryLazy",
    config = function()
        -- require("neodev").setup({
        --     library = {
        --         enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        --         -- these settings will be used for your Neovim config directory
        --         runtime = true, -- runtime path
        --         types = true,   -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        --         plugins = true, -- installed opt or start plugins in packpath
        --         -- you can also specify the list of plugins to make available as a workspace library
        --         -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        --     },
        --     setup_jsonls = false, -- INVERSE!!!!!
        --     -- configures jsonls to provide completion for project specific .luarc.json files
        --     -- for your Neovim config directory, the config.library settings will be used as is
        --     -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
        --     -- for any other directory, config.library.enabled will be set to false
        --     override = function(root_dir, options)
        --         if root_dir:find("lua/*", 1, true) then
        --             options.enabled = true
        --             options.runtime = true
        --             options.types = true
        --             options.plugins = true
        --         end
        --     end,
        --     -- With lspconfig, Neodev will automatically setup your lua-language-server
        --     -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
        --     -- in your lsp start options
        --     lspconfig = true,
        --     -- much faster, but needs a recent built of lua-language-server
        --     -- needs lua-language-server >= 3.6.0
        --     pathStrict = true,
        -- })

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
                ["<S-j>"] = cmp.mapping.select_next_item(),
                ["<S-k>"] = cmp.mapping.select_prev_item(),
                ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
            },
        })

        local telescope_builtin = require("telescope.builtin")

        -- See https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
        local notify = vim.notify
        ---@param msg string
        ---@param ... any
        vim.notify = function(msg, ...)
            if
                msg:match(
                    "warning: multiple different client offset_encodings detected for buffer, this is not supported yet"
                )
            then
                return
            end

            notify(msg, ...)
        end

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
                vim.lsp.buf.rename()
            end, opts)

            vim.keymap.set("n", "<leader>a", function()
                vim.lsp.buf.code_action()
            end, opts)

            vim.keymap.set("n", "<leader>xx", function()
                telescope_builtin.diagnostics()
            end, opts)
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
                        library = {
                            "${3rd}/luv/library",
                            unpack(vim.api.nvim_get_runtime_file("", true)),
                        },
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

        lsp_zero.setup()
    end,
}
