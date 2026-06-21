vim.g.mapleader = ' '      -- Set space bar as leader key.
vim.g.maplocalleader = ' ' -- Same as the above.


vim.keymap.set('n', "<leader>n", ":Lex 24<CR>", { desc = "Open Netrw file explorer." })
vim.keymap.set('n', "<leader>ex", ":Ex<CR>", { desc = "Open Netrw file explorer." })
vim.keymap.set('n', "<leader>ff", ":find ", { desc = "Open find command." })

vim.keymap.set('n', "<leader>bb", ":buffers<CR>", { desc = "List down all the buffers." })
vim.keymap.set('n', "<leader>bo", ":buffer ", { desc = "Open a buffer from buffers." })
vim.keymap.set('n', "<leader>bn", ":bnext<CR>", { desc = "Open next opened buffer." })
vim.keymap.set('n', "<leader>bp", ":bprevious<CR>", { desc = "Open previous opened buffer." })
vim.keymap.set('n', "<leader>bd", ":bdelete<CR>", { desc = "Delete opened buffer from the buffers." })
vim.keymap.set('n', "<leader>tt", ":terminal<CR>", { desc = "Enter terminal mode" })

vim.keymap.set('n', "<leader>gs", ":Git<CR>", { desc = "Show git status" })
vim.keymap.set('n', "<leader>gp", ":Git push<CR>", { desc = "Do git push" })
vim.keymap.set('n', "<leader>gd", ":Git diff<CR>", { desc = "Show git diff" })
vim.keymap.set('n', "<leader>gl", ":Git log<CR>", { desc = "Show git logs" })
vim.keymap.set('n', "<leader>ga", ":Git add", { desc = "Add the changes to git" })
vim.keymap.set('n', "<leader>gc", ":Git commit", { desc = "Commit to the changes" })
vim.keymap.set('n', "<leader>gr", ":Git reset", { desc = "Reset to a specific commit" })

vim.keymap.set('n', "<leader>fb", function()
    vim.lsp.buf.format()
end, { desc = "Format the current buffer." })

vim.keymap.set('i', "<c-space>", function()
    vim.lsp.completion.get()
end, { desc = "Get LSP completion options" })

vim.keymap.set('n', "<leader>ca", function()
    vim.lsp.buf.code_action()
end, { desc = "Open code action(s)" })

vim.keymap.set('n', "<leader>gi", function()
    vim.lsp.buf.implementation()
end, { desc = "Go to the implementation" })

vim.keymap.set('n', "<leader>gt", function()
    vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })
