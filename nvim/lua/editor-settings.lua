-- Author: Krishal
-- Github: ikrsx
-- Description: Configuration module for basic settings.

--------------------------
---   VISUAL STYLING   ---
--------------------------
vim.opt.number = true                  -- Show line numbers.
vim.opt.relativenumber = true          -- Show relative line numbers.
vim.opt.cursorline = true              -- Highlight the current cursor line.
vim.opt.winborder = "rounded"          -- Show rounded pop-up menu.
vim.opt.termguicolors = true           -- Use 256-bit terminal colors.
vim.opt.signcolumn = "yes"             -- Show sign column for warnings or errors in lines.
vim.opt.colorcolumn = ""               -- Use default colors for sign columns.
vim.cmd.colorscheme("catppuccin-nvim") -- Set color scheme for the editor.
vim.g.netrw_banner = 0                 -- Disable the Netrw's banner.
vim.g.netrw_liststyle = 3              -- Enable tree-style listing in Netrw.

--------------------------
---      EDITING       ---
--------------------------
vim.opt.tabstop = 4                  -- Set tabs equal to 4 spaces.
vim.opt.softtabstop = 4              -- Set soft tabs equal to 4 spaces.
vim.opt.shiftwidth = 4               -- Set the number of spaces to use for each step of (auto)indent.
vim.opt.expandtab = true             -- Convert tab to spaces.
vim.opt.smartindent = true           -- Enable smart indentation.
vim.opt.autoindent = true            -- Enable auto-indentation.
vim.opt.spell = true                 -- Enable spell checking.
vim.opt.spelllang = "en_us"          -- Set the spelling checking language.
vim.opt.clipboard = "unnamedplus"    -- Yank to system clipboard and vice versa.
vim.cmd.filetype("plugin indent on") -- Enable file-type detection, plugins, and indentation.

--------------------------
---     SEARCHING      ---
--------------------------
vim.opt.showmatch = true  -- Automatically show match while searching.
vim.opt.hlsearch = false  -- Do not highlight the search results.
vim.opt.incsearch = true  -- Search incrementally while typing.
vim.opt.ignorecase = true -- Do case-insensitive searching.
vim.opt.path = "**"       -- Include sub-directories while searching files.

--------------------------
---  FILE MANAGEMENT   ---
--------------------------
vim.opt.backup = false                                   -- Do not create backup files.
vim.opt.writebackup = false                              -- Do not write or update to backup files.
vim.opt.swapfile = false                                 -- Do not create swap files.
vim.opt.undofile = true                                  -- Enable undo file editing.
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undodir") -- Create a custom undo directory.
vim.opt.autoread = true                                  -- Auto reload files modified other than Neovim.
vim.opt.updatetime = 300                                 -- Faster completion time.
