-- syntax highlighting for lsp
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter")
		configs.setup({
			ensure_installed = { },
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
