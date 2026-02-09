---------------------------------------------
-- Configuration for Neovim text editor.
-- Author: Krishal
-- Github: github.com/ikrsx
-- Useage: Add the lua modules & edit genral
-- settings.
---------------------------------------------

---------------------------
--- Load Lua Modules  -----
---------------------------
require("lazy_nvim")
require("language_servers")
require("keybindings")
require("autocommands")
require("statusline")

---------------------------
----- Visual Setting -----
---------------------------
vim.o.termguicolors = true       -- Enables 24-bit colors.
vim.cmd.colorscheme "catppuccin" -- Set the colorscheme.
vim.o.number = true              -- Sets line numbers.
vim.o.relativenumber = true      -- Sets relative line numbers.
vim.o.cursorline = true          -- Shows cursor line.
vim.o.winborder = "rounded"      -- Shows rounded border around pop-up menu.
vim.o.showmode = false           -- Disables showing current mode in command line.
vim.o.pumheight = 10             -- Sets the height of the popup menu.
vim.g.netrw_liststyle = 3        -- Enable tree view for netrw.
vim.g.netrw_banner = 0           -- Disable the above banner for netrw.

----------------------------
----- Tabsize Settings -----
----------------------------
vim.o.tabstop = 2        -- Number of spaces for a tab.
vim.o.shiftwidth = 2     -- Number of spaces for auto-indent.
vim.o.softtabstop = 2    -- Number of spaces a tab counts for while editing.
vim.o.expandtab = true   -- Converts tabs to spaces.
vim.o.smartindent = true -- Enables auto indentation.
vim.o.autoindent = true  -- Copies indentation from current line.

----------------------------
----- Search Settings ------
----------------------------
vim.o.ignorecase = true -- Always do case insensitive searching.
vim.o.smartcase = true  -- Enable smart case searching.
vim.o.hlsearch = false  -- Disables highlighting search results.
vim.o.incsearch = true  -- Shows matches whenever you start to type to search.
vim.o.path = "**"       -- Enables fuzzy finding by defualt.

----------------------------
----- Backup Settings ------
----------------------------
vim.o.backup = false      -- Disables creating backup files.
vim.o.writebackup = false -- Disables creating backup files before writing.
vim.o.swapfile = false    -- Disables creating swap files.
vim.o.undofile = true     -- Enable creating undo files for persisting last file editing.
-- Creates an undo directory to store undo history.
vim.o.undodir = vim.fn.expand("~/.cache/nvim/undos")
vim.o.autoread = true -- Auto reload files changed outside of Neovim.

----------------------------
----- Editing Settings -----
----------------------------
vim.opt.clipboard:append("unnamedplus") -- Enables using system clipboard for yanking.
