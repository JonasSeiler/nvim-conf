return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "cpp", "java","c", "lua", "vim", "vimdoc", "query", "markdown", },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}}
