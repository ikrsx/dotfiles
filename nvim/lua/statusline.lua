---------------------------------------------
-- Statusline for Neovim.
-- Author: Krishal
-- Github: github.com/ikrsx
-- Useage: Create your custom statusline.
---------------------------------------------

-- Get file type of current buffer and map it to its corresponding icon.
function get_file_icon()
  local file_type = vim.bo.filetype

  local file_icons = {
    lua = " ",
    nix = "󱄅 ",
    netrw = " ",
    c = " ",
    cpp = " ",
    cc = " ",
    css = " ",
    hyprlang = " ",
    html = " ",
    go = " ",
    dart = " ",
    sh = " ",
    javascript = " ",
    json = " ",
    typescript = " ",
    toml = " ",
    dosini = " ",
    config = " ",
    text = " ",
  }

  if file_type == " " then
    return ""
  end

  return (file_icons[file_type] or file_type)
end

-- Get current mode of the buffer and map it to its corresponding icon.
function get_mode_icon()
  local current_mode = vim.fn.mode()

  local nvim_modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "VISUAL-LINE",
    ["\22"] = "VISUAL-BLOCK",
    c = "COMMAND",
    s = "SELECT",
    S = "SELECT-LINE",
    ["\19"] = "SELECT-BLOCK",
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL",
  }

  return nvim_modes[current_mode]
end

-- Get directory name of current buffer.
function get_directory()
  local path = vim.fn.expand("%:p")
  local strings = {}

  for str in string.gmatch(path, "([^/']+)") do
    table.insert(strings, str)
  end

  return strings[#strings - 1]
end

-- Set the custom status line.
vim.o.statusline = table.concat {
  " ",
  " ",
  "%{v:lua.get_mode_icon()}",
  " | ",
  " ",
  "%p%%",
  "%=",
  "%{v:lua.get_file_icon()}",
  "%t",
  " | ",
  " ",
  "%{v:lua.get_directory()}",
  " ",
}
