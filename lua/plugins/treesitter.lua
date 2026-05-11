return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			branch = "main",
			build = ":TSUpdate",
		},
	},
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "*" },
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		require("nvim-treesitter").install({
			"c",
			"cpp",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"python",
			"java",
			"javascript",
			"typescript",
			"html",
			"markdown",
			"markdown_inline",
			"make",
			"regex",
			"latex",
			"rust",
			"zig",
			"asm",
			"toml",
			"yaml",
			"json",
		})

		-- configuration
		require("nvim-treesitter-textobjects").setup({
			select = {
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				-- You can choose the select mode (default is charwise 'v')
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * method: eg 'v' or 'o'
				-- and should return the mode ('v', 'V', or '<c-v>') or a table
				-- mapping query_strings to modes.
				selection_modes = {
					["@function.outer"] = "v", -- linewise
					["@function.inner"] = "v", -- linewise
					-- ['@class.outer'] = '<c-v>', -- blockwise
				},
				-- If you set this to `true` (default is `false`) then any textobject is
				-- extended to include preceding or succeeding whitespace. Succeeding
				-- whitespace has priority in order to act similarly to eg the built-in
				-- `ap`.
				--
				-- Can also be a function which gets passed a table with the keys
				-- * query_string: eg '@function.inner'
				-- * selection_mode: eg 'v'
				-- and should return true of false
				include_surrounding_whitespace = false,
			},
		})

		-- keymaps
		-- You can use the capture groups defined in `textobjects.scm`
		vim.keymap.set({ "x", "o" }, "af", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end)
		vim.keymap.set({ "x", "o" }, "if", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end)
	end,
	-- config = function()
	-- 	-- require("nvim-treesitter.configs").setup({
	-- 	require("nvim-treesitter").setup({
	-- 		-- A list of parser names, or "all" (the five listed parsers should always be installed)
	-- 		ensure_installed = {
	-- 			"c",
	-- 			"cpp",
	-- 			"lua",
	-- 			"vim",
	-- 			"vimdoc",
	-- 			"query",
	-- 			"java",
	-- 			"javascript",
	-- 			"typescript",
	-- 			"html",
	-- 			"markdown",
	-- 			"markdown_inline",
	-- 			"make",
	-- 			"regex",
	-- 			"latex",
	-- 			"rust",
	-- 		},
	--
	-- 		ignore_install = {},
	--
	-- 		-- Install parsers synchronously (only applied to `ensure_installed`)
	-- 		sync_install = false,
	--
	-- 		-- Automatically install missing parsers when entering buffer
	-- 		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	-- 		auto_install = true,
	--
	-- 		highlight = {
	-- 			enable = true,
	--
	-- 			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- 			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- 			-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- 			-- Instead of true it can also be a list of languages
	-- 			additional_vim_regex_highlighting = false,
	-- 		},
	--
	-- 		indent = {
	-- 			enable = true,
	-- 		},
	--
	-- 		modules = {},
	--
	-- 		textobjects = {
	-- 			select = {
	-- 				enable = true,
	-- 				lookahead = true,
	-- 				keymaps = {
	-- 					["af"] = "@function.outer",
	-- 					["if"] = "@function.inner",
	-- 				},
	-- 			},
	-- 		},
	-- 	})
	--
	-- 	vim.api.nvim_create_autocmd("FileType", {
	-- 		pattern = { "<filetype>" },
	-- 		callback = function()
	-- 			vim.treesitter.start()
	-- 		end,
	-- 	})
	-- end,
}
