---------------------------------------------
-- Language server configuration.
-- Author: Krishal
-- Github: github.com/ikrsx
-- Credit: github.com/neovim/nvim-lspconfig
-- Useage: configure your own language server
-- using built-in lsp.
---------------------------------------------

----------------------------
--  Lua Language Server   --
----------------------------
vim.lsp.config['luals'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}

vim.lsp.enable('luals')

------------------------------
-- Nix language server(nil) --
------------------------------
vim.lsp.config['nil_ls'] = {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
}

vim.lsp.enable('nil_ls')

------------------------------
--- Clangd language server ---
------------------------------
vim.lsp.config['clangd'] = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    '.git',
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  }
}

vim.lsp.enable('clangd')

------------------------------
---- Bash language server ----
------------------------------
vim.lsp.config['bashls'] = {
  cmd = { 'bash-language-server', 'start' },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },
  filetypes = { 'bash', 'sh' },
  root_markers = { '.git' },
}

vim.lsp.enable('bashls')

------------------------------
--------- Marksman -----------
------------------------------
vim.lsp.config['marksman'] = {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.marksman.toml', '.git' },
}

vim.lsp.enable('marksman')
