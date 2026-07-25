vim.pack.add({
	gh("neovim/nvim-lspconfig"),
	gh("williamboman/mason.nvim"),
	gh("williamboman/mason-lspconfig.nvim"),
	gh("hrsh7th/nvim-cmp"),
	gh("folke/lazydev.nvim"),
	gh("artemave/workspace-diagnostics.nvim"),
	gh("RubixDev/mason-update-all"),
})

local cmp = require("cmp")
cmp.setup({
	sources = cmp.config.sources({
		{ name = "lazydev", group_index = 0 },
	}),
})

require("mason").setup({
	ui = {
		border = "rounded",
	},
})
require("mason-lspconfig").setup({
	automatic_enable = true,
})

local ensure_installed = {
	"asmfmt",
	"bash-language-server",
	"basics-language-server",
	"beautysh",
	"checkmake",
	"clang-format",
	"clangd",
	"gopls",
	"json-lsp",
	"lua-language-server",
	"luacheck",
	"pyright",
	"rust-analyzer",
	"shfmt",
	"stylua",
	"texlab",
	"verible",
	"vim-language-server",
	"zls",
}

local registry = require("mason-registry")

for _, package in ipairs(ensure_installed) do
	local package_info = registry.get_package(package)

	if not package_info:is_installed() then
		print("Package " .. package .. " is not installed. Installing...")
		package_info:install({})
	end
end

require("mason-update-all").setup({})

vim.lsp.config["lua_ls"] = {
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
			completion = {
				singleFileMode = false,
			},
		},
	},
	filetypes = { "lua" },
}
vim.lsp.enable("lua_ls", true)

local basic_servers = {
	["bashls"] = { "sh", "zsh" },
	["clangd"] = { "c", "cpp", "objc", "objcpp", "h" },
	["gopls"] = { "go" },
	["zls"] = { "zig" },
	["verible"] = { "systemverilog", "verilog" },
	["pyright"] = { "python" },
	["texlab"] = { "latex", "markdown" },
	["rust_analyzer"] = { "rust" },
}

for server, _ in pairs(basic_servers) do
	-- vim.lsp.config(server, {
	-- 	filetypes = fts,
	-- })
	vim.lsp.enable(server, true)
end

local generic_servers = {
	"basics_ls",
}

for _, server in ipairs(generic_servers) do
	vim.lsp.config(server, {
		filetypes = nil,
	})
	vim.lsp.enable(server, true)
end

vim.g.zig_fmt_autosave = 0

require("workspace-diagnostics").setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local bufnr = event.buf
		local opts = { buffer = bufnr, remap = false }

		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)

		vim.keymap.set("n", "<leader>i", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)

		vim.keymap.set("n", "<leader>r", function()
			vim.lsp.buf.rename()
		end, opts)

		vim.keymap.set({ "n", "v" }, "<leader>a", function()
			vim.lsp.buf.code_action({})
		end, opts)
	end,
})

-- Below diagnostics config and autocmds lifted from https://www.reddit.com/r/neovim/comments/1jpbc7s/disable_virtual_text_if_there_is_diagnostic_in/?share_id=TMnSUgCygO7v9SW_qlAv4&utm_medium=ios_app&utm_name=ioscss&utm_source=share&utm_term=1
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = { current_line = true },
	underline = true,
	update_in_insert = false,
	signs = false,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
	group = vim.api.nvim_create_augroup("diagnostic_virt_text_hide", {}),
	callback = function(ev)
		local lnum, _ = unpack(vim.api.nvim_win_get_cursor(0))
		lnum = lnum - 1 -- need 0-based index

		local hidden_lnum = vim.b[ev.buf].diagnostic_hidden_lnum
		if hidden_lnum and hidden_lnum ~= lnum then
			vim.b[ev.buf].diagnostic_hidden_lnum = nil
			-- display all the decorations if the current line changed
			vim.diagnostic.show(nil, ev.buf)
		end

		for _, namespace in pairs(vim.diagnostic.get_namespaces()) do
			local ns_id = namespace.user_data.virt_text_ns
			if ns_id then
				local extmarks = vim.api.nvim_buf_get_extmarks(ev.buf, ns_id, { lnum, 0 }, { lnum, -1 }, {})
				for _, extmark in pairs(extmarks) do
					local id = extmark[1]
					vim.api.nvim_buf_del_extmark(ev.buf, ns_id, id)
				end

				if extmarks and not vim.b[ev.buf].diagnostic_hidden_lnum then
					vim.b[ev.buf].diagnostic_hidden_lnum = lnum
				end
			end
		end
	end,
})
