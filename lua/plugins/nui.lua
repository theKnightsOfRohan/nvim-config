return {
    "MunifTanjim/nui.nvim",
    config = function()
        local Menu = require("nui.menu")

        vim.ui.select = function(items, opts, on_choice)
            vim.validate({
                items = { items, 'table', false },
                opts = { opts, 'table', true },
                on_choice = { on_choice, 'function', false },
            })
            opts = opts or {}
            local format_item = opts.format_item or tostring

            Menu({
                relative = "cursor",
                position = {
                    row = 2,
                    col = 0,
                },
                size = {
                    width = 40,
                },
                zindex = 1000,
                border = {
                    style = "rounded",
                    text = {
                        top = opts.prompt or "Select an item",
                        top_align = "center",
                    },
                },
            }, {
                lines = (function()
                    ---@type NuiTree.Node[]
                    local selections = {}

                    for _, item in ipairs(items) do
                        if type(item) == "string" then
                            table.insert(selections, Menu.item(item))
                        elseif type(item) == "table" then
                            table.insert(selections, Menu.item(format_item(item), item))
                        end
                    end

                    return selections
                end)(),

                on_close = function()
                    print("Closed")
                end,
                on_submit = function(selected)
                    on_choice(selected)
                end,
            }):mount()
        end

        vim.keymap.set("n", "<leader><leader>", function()
            vim.ui.select({ 'One', 'Two', 'Three' }, {}, function(selected)
                print("Selected: " .. selected)
            end)
        end)
    end,
}
