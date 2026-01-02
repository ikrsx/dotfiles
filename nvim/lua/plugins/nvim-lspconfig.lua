-- settings for lsp servers
return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("bash-language-server")
		vim.lsp.enable("nil")
		vim.lsp.enable("clangd")
	end,
}
