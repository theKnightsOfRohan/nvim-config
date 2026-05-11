return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "chrisgrieser/nvim-scissors",
        "nvim-telescope/telescope.nvim",
        "garymjr/nvim-snippets",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        -- default settings
        -- default settings
        require("scissors").setup({
            snippetDir = vim.fn.stdpath("config") .. "/snippets",
            editSnippetPopup = {
                height = 0.4, -- relative to the window, between 0-1
                width = 0.6,
                border = vim.fn.has("nvim-0.11") == 1 and vim.o.winborder or "rounded",
                keymaps = {
                    -- if not mentioned otherwise, the keymaps apply to normal mode
                    cancel = "q",
                    saveChanges = "<CR>", -- alternatively, can also use `:w`
                    goBackToSearch = "<BS>",
                    deleteSnippet = "<C-BS>",
                    duplicateSnippet = "<C-d>",
                    openInFile = "<C-o>",
                    insertNextPlaceholder = "<C-p>", -- insert & normal mode
                    showHelp = "?",
                },
            },

            snippetSelection = {
                picker = "auto", ---@type "auto"|"telescope"|"snacks"|"vim.ui.select"

                telescope = {
                    -- By default, the query only searches snippet prefixes. Set this to
                    -- `true` to also search the body of the snippets.
                    alsoSearchSnippetBody = false,

                    -- accepts the common telescope picker config
                    opts = {
                        layout_strategy = "horizontal",
                        layout_config = {
                            horizontal = { width = 0.9 },
                            preview_width = 0.6,
                        },
                    },
                },
            },

            backdrop = {
                enabled = true,
                blend = 50, -- between 0-100
            },
            icons = {
                scissors = "󰩫",
            },
        })

        local ls = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = {
                vim.fn.stdpath("config") .. "/snippets",
            },
        })

        vim.keymap.set({ "i", "s" }, "<M-l>", function()
            ls.expand_or_jump(1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<M-h>", function()
            ls.jump(-1)
        end, { silent = true })

        local cmp = require("cmp")

        cmp.setup({
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<M-j>"] = cmp.mapping.select_next_item(),
                ["<M-k>"] = cmp.mapping.select_prev_item(),
                ["<M-l>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
            },
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
        })
    end,
}
