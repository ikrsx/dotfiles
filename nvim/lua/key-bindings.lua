-- Author: Krishal
-- Github: ikrsx
-- Description: Add new key bindings for the editor.

vim.g.mapleader = ' '      -- Set space bar as leader key.
vim.g.maplocalleader = ' ' -- Same as the above.


vim.keymap.set('n', "<leader>n", ":Lex 24<CR>", { desc = "Open Netrw file explorer." })
vim.keymap.set('n', "<leader>ff", ":find ", { desc = "Open find command." })
vim.keymap.set('n', "<leader>bb", ":buffers<CR>", { desc = "List down all the buffers." })
vim.keymap.set('n', "<leader>bo", ":buffer ", { desc = "Open a buffer from buffers." })
vim.keymap.set('n', "<leader>bn", ":bnext<CR>", { desc = "Open next opened buffer." })
vim.keymap.set('n', "<leader>bp", ":bprevious<CR>", { desc = "Open previous opened buffer." })
vim.keymap.set('n', "<leader>bd", ":bdelete<CR>", { desc = "Delete opened buffer from the buffers." })
vim.keymap.set('n', "<leader>fb", ":lua vim.lsp.buf.format()<CR>", { desc = "Format the current buffer." })
vim.keymap.set('n', "<leader>tt", ":terminal<CR>", { desc = "Enter terminal mode" })
vim.keymap.set('n', "<leader>gs", ":Git<CR>", { desc = "Show git status" })
vim.keymap.set('n', "<leader>gp", ":Git push<CR>", { desc = "Do git push" })
vim.keymap.set('n', "<leader>gd", ":Git diff<CR>", { desc = "Show git diff" })
vim.keymap.set('n', "<leader>gl", ":Git log<CR>", { desc = "Show git logs" })
