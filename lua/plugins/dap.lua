return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")

        dap.adapters.c = {
            type = "server",
            port = "42069",
            executable = {
                command = "codelldb",
                args = { "--port", "42069" },
            },
        }

        dap.configurations.c = {
            {
                type = "c",
                request = "launch",
                name = "Launch C Program",
                program = function()
                    return vim.fn.input({
                        prompt = "Path to executable: ",
                        default = vim.fn.getcwd() .. "/",
                        completion = "file",
                    })
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = true,
                args = {},
                runInTerminal = false,
            },
        }

        local dapui = require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}
