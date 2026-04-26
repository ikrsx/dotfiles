-- Author: Krishal
-- Github: ikrsx
-- Description: Add your plugins and install them using Neovim Pack.
vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/catppuccin/nvim",
    "https://github.com/Saghen/blink.cmp",
    "https://github.com/saghen/blink.lib",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/tpope/vim-fugitive",
})

require("blink.cmp").setup({
    fuzzy = { implementation = "lua" }
})                                  -- Setup Blink completion.

require("nvim-autopairs").setup({}) -- Setup auto pairs.
