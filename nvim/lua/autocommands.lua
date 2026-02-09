---------------------------------------------
-- Autocommands for Neovim.
-- Author: Krishal
-- Github: github.com/ikrsx
-- Useage: Create your own autocommands for
-- Neovim.
---------------------------------------------
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end
})

-- Close terminal when process exits.
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      local buffer_number = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_delete(buffer_number, {})
    end
  end
})

-- Return to last editing line when reopening a file.
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})
