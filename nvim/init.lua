-------------------------------
--        Startup            --
-------------------------------

require "plugins"                                 -- Load Lazy
require "luasnip.loaders.from_vscode".lazy_load() -- Load Snippet Engine
require "blink.cmp".setup({
  fuzzy = { implementation = "lua" }
}) -- Load Completion Engine

----------------------------------
-- Native Language Server Setup --
----------------------------------
vim.lsp.config('lua_ls', {
  cmd = { "lua-language-server" },
  root_markers = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
  },
  filetypes = { "lua" },
}) -- Lua Language Server

vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },
  root_markers = { '.git' },
  filetypes = { 'bash', 'sh' },
}) -- Bash Language Server

vim.lsp.config('clangd', {
  cmd = { "clangd" },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}) -- Clangd

vim.lsp.config('nil_ls', {
  cmd = { "nil" },
  root_markers = { ".git", "flake.nix" },
  filetypes = { "nix" },
}) -- Nil Language Server

vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  root_markers = { '.marksman.toml', '.git' },
  filetypes = { 'markdown', 'markdown.mdx' },
}) -- Marksman

-- Enable LSP Servers
vim.lsp.enable {
  "lua_ls",
  "bashls",
  "clangd",
  "nil_ls",
  "marksman",
}

-------------------------------
--      Neovim Settings      --
-------------------------------

-- Theme & Transparency
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Basic Settings
vim.opt.number = true             -- Line numbers
vim.opt.relativenumber = true     -- Relative Line numbers
vim.opt.cursorline = true         -- Highlight current line
vim.opt.wrap = true               -- Set word wrap
vim.opt.fillchars = { eob = ' ' } -- Hide End Of Buffer Sign
vim.opt.scrolloff = 10            -- Scroll number of lines above/below cursor
vim.opt.sidescrolloff = 8         -- Scroll number of charecters

-- Indendation
vim.opt.tabstop = 2        -- Tab width
vim.opt.shiftwidth = 2     -- Indentation width
vim.opt.softtabstop = 2    -- Soft tab stop
vim.opt.expandtab = true   -- Switch from tabs to spaces
vim.opt.smartindent = true -- Toggle smart or auto-indentation
vim.opt.autoindent = true  -- Copy indent from current line

-- Search Settings
vim.opt.ignorecase = true -- Toggle case insensitive search
vim.opt.smartcase = true  -- Toggle smart case search if necessary
vim.opt.hlsearch = false  -- Toggle highlight results on search
vim.opt.incsearch = true  -- Toggle live matches as you type

-- Visual Settings
vim.opt.termguicolors = true                      -- Toggle 24-bit colors
vim.opt.signcolumn = "yes"                        -- Always show sign signal
vim.opt.colorcolumn = "1000"                      -- Show column at 100 charecters
vim.opt.showmatch = true                          -- Highlight matching brackets
vim.opt.matchtime = 2                             -- How long to show matching brackets
vim.opt.cmdheight = 1                             -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false                          -- Toggle to show mode in command line
vim.opt.pumheight = 10                            -- Pop menu height
vim.opt.pumblend = 10                             -- Pop menu transparency
vim.opt.winblend = 0                              -- Floating window transparency
vim.opt.winborder = "rounded"                     -- Floating window bordered
vim.opt.conceallevel = 0                          -- Don't hide markup
vim.opt.concealcursor = ""                        -- Dont't hide cursor line markup
vim.opt.lazyredraw = true                         -- Don't redraw during macros
vim.opt.synmaxcol = 300                           -- Syntax hightlight limit

-- File Handling
vim.opt.backup = false                                -- Don't create backup files
vim.opt.writebackup = false                           -- Dont't create backup before writing
vim.opt.swapfile = false                              -- Don't create swap files
vim.opt.undofile = true                               -- Persist undos
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo") -- Undo directory
vim.opt.updatetime = 300                              -- Faster completion
vim.opt.timeoutlen = 500                              -- Key timout duration
vim.opt.ttimeoutlen = 0                               -- Key code timout
vim.opt.autoread = true                               -- Auto reload files changed outside vim
vim.opt.autowrite = false                             -- Don't auto save

-- Behavioural Settings
vim.opt.hidden = true                                    -- Allow hidden buffers
vim.opt.errorbells = false                               -- Disable error bells
vim.opt.backspace = "indent,eol,start"                   -- Better backspacing
vim.opt.autochdir = false                                -- Don't auto change direcotries
vim.opt.iskeyword:append("-")                            -- Treat '-' as part of word
vim.opt.path:append("**")                                -- Inlude sub directories in search
vim.opt.selection = "exclusive"                          -- Selection behaviour
vim.opt.mouse = "a"                                      -- Enable mouse support
vim.opt.completeopt = { "menuone", "noselect", "popup" } -- Autocomplete options
vim.opt.clipboard:append("unnamedplus")                  -- Use system clipboard
vim.opt.modifiable = true                                -- Allow buffer modification
vim.opt.encoding = "UTF-8"                               -- Set encoding

-- File Browser
vim.g.netrw_banner = 0    -- Disbable banner for explorer
vim.g.netrw_liststyle = 3 -- Type of list for explorer

-- Commandline Completions
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better Diff
vim.opt.diffopt:append("linematch:60")

-- Performance Improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-------------------------------
--        Key Maps           --
-------------------------------

-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank To End Of Line
vim.keymap.set("n", "Y", "y$")

-- Editing
vim.keymap.set("n", "<leader>s", ":write<CR>", { desc = "Write/Save current file" })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Quit/Close current file" })
vim.keymap.set("n", "<leader>qf", ":quit!<CR>", { desc = "Quit/Close forcefully current file" })
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format the current file" })
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "Trigger autocompletion" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Type Definition" })
vim.keymap.set("i", "'", "''<left>", { desc = "Automatically close the single quotes" })
vim.keymap.set("i", "\"", "\"\"<left>", { desc = "Automatically close the double quotes" })
vim.keymap.set("i", "(", "()<left>", { desc = "Automatically close the rounded braces" })
vim.keymap.set("i", "[", "[]<left>", { desc = "Automatically close the square braces" })
vim.keymap.set("i", "<", "<><left>", { desc = "Automatically close the angular braces" })
vim.keymap.set("i", "{", "{}<left>", { desc = "Automatically close the curly braces" })
vim.keymap.set("i", "{;", "{};<left><left>", { desc = "Automatically close the curly braces with semi-colon" })
vim.keymap.set("i", "/*", "/**/<left><left>", { desc = "Automatically close the mutliline comment" })

-- Quick Navigations
vim.keymap.set("n", "<leader>n", ":24Lex<CR>", { desc = "Open file browser" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find files" })

-- Tab Management
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>w", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>l", ":tabnext<CR>", { desc = "Cycle to next tab" })
vim.keymap.set("n", "<leader>h", ":tabprev<CR>", { desc = "Cycle to previous tab" })

-- Move Lines Up/Down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Indent In Visual Mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left and reselect" })

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end
)

-------------------------------
--      Tabline Config       --
-------------------------------

-- Get File Type Of Current Buffer
function get_file_type()
  local ext = vim.bo.filetype
  local icons = {
    lua = "",
    c = "",
    cpp = "",
    cs = "",
    markdown = "",
    vim = "",
    netrw = "",
    sh = "",
    make = "",
    qml = "",
    xml = "",
    go = "",
    text = "",
    rust = "",
    python = "",
    typescript = "",
    javascript = "",
    html = "",
    css = "",
    json = "",
    jsonc = "",
    toml = "",
    yaml = "",
    dart = "",
    hyprlang = "",
    conf = "",
    dosini = "",
  }

  if ext == "" then
    return ""
  end

  return (icons[ext] or ext)
end

-- Tabline Colors
vim.cmd("hi TabLineSelColor guibg=#1e1e2e guifg=#bac2de")
vim.cmd("hi FileEditColor guibg=None guifg=#f2cdcd")

-- Create A Custom Tab
function CustomTabline()
  local s = ' '
  for i = 1, vim.fn.tabpagenr('$') do
    -- Highlight current tab
    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSelColor#" .. get_file_type()
    else
      s = s .. "%#TabLine#"
    end
    -- Buffer count and names in tab
    local bufnrs = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufname = vim.fn.bufname(bufnrs[winnr])
    if bufname ~= '' then
      s = s ..
          ' ' ..
          vim.fn.fnamemodify(bufname, ':t') ..
          (vim.bo[bufnrs[winnr]].modified and "%#FileEditColor# " or '') ..
          ' '
    else
      s = s .. " [New] "
    end
    s = s .. "%T%T"           -- Tab separator
  end
  s = s .. "%#TabLineFill#%=" -- Filler and right-align
  return s
end

vim.opt.showtabline = 2                     -- Always show tabline
vim.opt.tabline = "%!v:lua.CustomTabline()" -- Apply Configuration Function


-------------------------------
--    Statusline Config      --
-------------------------------

-- Get Git Branch Name
function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "  " .. branch .. " "
  end
  return ""
end

-- Count Number Of Untracked Files
function git_count_untracked_files()
  local count = vim.fn.system("git status --porcelain 2>/dev/null | grep '^??' | wc -l | tr -d '\n'")
  if count ~= "0" then
    return "+" .. count .. " "
  end
  return ""
end

-- Count Number Of Modified Files
function git_count_modified_files()
  local count = vim.fn.system("git status --porcelain 2>/dev/null | grep -E '^( M|M )' | wc -l | tr -d '\n'")
  if count ~= "0" then
    return "~" .. count .. " "
  end
  return ""
end

-- Count Number Of Deleted Files
function git_count_deleted_files()
  local count = vim.fn.system("git status --porcelain 2>/dev/null | grep -E '^( D|D )' | wc -l | tr -d '\n'")
  if count ~= "0" then
    return "-" .. count .. " "
  end
  return ""
end

-- Get Directory Name Of Current Buffer
function buffer_directory()
  local dir = vim.fn.getcwd()
  return "   " .. vim.fs.basename(dir) .. " "
end

-- Get Mode Of The Editor
function mode_initcator()
  local mode = vim.fn.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "VISUAL LINE",
    ["\22"] = "VISUAL BLOCK",
    c = "COMMAND",
    s = "SELECT",
    S = "SELECT LINE",
    ["\19"] = "SELECT BLOCK",
    R = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL",
  }
  return modes[mode] or " "
end

-- Set Color Modes
vim.cmd("hi StatusLine guibg=#1e1e2e guifg=#9399b2")
vim.cmd("hi ModeColor guibg=#cba6f7 guifg=#11111b")
vim.cmd("hi ModeColorEnd guibg=None guifg=#cba6f7")
vim.cmd("hi DirectoryColor guibg=#eba0ac guifg=#11111b")
vim.cmd("hi DirectoryColorEnd guibg=None guifg=#eba0ac")
vim.cmd("hi BranchColor guibg=None guifg=#a6e3a1")
vim.cmd("hi GitUntrackedColor guibg=None guifg=#f9e2af")
vim.cmd("hi GitModifiedColor guibg=None guifg=#94e2d5")
vim.cmd("hi GitDeletionColor guibg=None guifg=#f38ba8")

-- Set Custom Status Line
vim.opt.statusline =
    "%#ModeColor#" ..
    "  %{v:lua.mode_initcator()}" ..
    "%#ModeColorEnd#" .. "" ..
    "%##" ..
    "%#BranchColor#" ..
    "%{v:lua.git_branch()}" ..
    "%##" ..
    "%#GitUntrackedColor#" ..
    "%{v:lua.git_count_untracked_files()}" ..
    "%#GitModifiedColor#" ..
    "%{v:lua.git_count_modified_files()}" ..
    "%#GitDeletionColor#" ..
    "%{v:lua.git_count_deleted_files()}" ..
    "%##" ..
    " %= " ..
    " %n " ..
    "󰦖 %p%% " ..
    "%#DirectoryColorEnd#" ..
    "" ..
    "%#DirectoryColor#" ..
    "%{v:lua.buffer_directory()}"

-------------------------------
--    Basic Autocommands     --
-------------------------------

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight Yanked Texts
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end
})

-- Open Help In Vertical Split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Don't Continue Comments For Next Line On Enter
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end
})

-- Return To Last Editing Line When Opening Files
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

-- Create Undo Directory If It Does'nt Exsits
local undodir = vim.fn.expand("~/.cache/nvim/undos")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
