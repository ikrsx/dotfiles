---------------------------------------------
-- Keybindings for Neovim.
-- Author: Krishal
-- Github: github.com/ikrsx
-- Useage: Add your custom keybindings.
---------------------------------------------

vim.g.mapleader = " "      -- Set spacebar as a leader key.
vim.g.maplocalleader = " " -- Set spacebar as local leader key.

-- Others
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Show find command" })
vim.keymap.set("n", "<leader>n", ":24Lex<CR>", { desc = "Open the netrw" })
vim.keymap.set("n", "<leader>t", ":terminal<CR>", { desc = "Open the terminal buffer" })

-- Buffer workflow
vim.keymap.set("n", "<leader>bb", ":buffer ", { desc = "Go to specific buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Show next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Show previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", { desc = "Delete/Close current buffer" })

-- Window workflow
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertically split the window" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width of the active split the window" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width of the active split the window" })
vim.keymap.set("n", "<leader>ww", ":split<CR>", { desc = "Horizontally split the window" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height of the active split the window" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height of the active split the window" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { desc = "Close the active split window" })

-- Window focus workflow
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus to right split window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus to left split window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus to bottom split window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus to top split window" })

-- Window movements workflow
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- LSP workflow
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format the current file/document." })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions for any diagnostics" })
