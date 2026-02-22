---------------------------------------------
-- Lazy.nvim for Neovim text editor.
-- Author: Krishal
-- Github: github.com/ikrsx
-- Useage: Add your required pluings.
---------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Plugins
  spec = {
    -- Catppuccin colorscheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Gruvbox colorscheme
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },

    -- Blink.cmp
    {
      'saghen/blink.cmp',
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*',
      opts = {
        keymap = { preset = 'enter' },
        appearance = {
          nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = false } },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    }
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
