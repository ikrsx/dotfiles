-- Author: Krishal
-- Github: ikrsx
-- Description: Enable various Language Server Protocols.
vim.lsp.enable("lua_ls")                 -- Lua
vim.lsp.enable("nil_ls")                 -- Nix
vim.lsp.enable("bashls")                 -- Bash
vim.lsp.enable("clangd")                 -- C/C++
vim.lsp.enable("gopls")                  -- Go
vim.lsp.enable("dartls")                 -- Dart
vim.lsp.enable("marksman")               -- Markdown
vim.lsp.enable("html")                   -- HTML
vim.lsp.enable("cssls")                  -- CSS
vim.lsp.enable("ts_ls")                  -- Type/Javascript
vim.lsp.enable("tailwindcss")            -- Tailwind CSS
vim.lsp.enable("sqls")                   -- SQL
vim.lsp.enable("eslint")                 -- Formatting For JS/TS
vim.lsp.enable("jsonls")                 -- JSON
vim.lsp.enable("yamlls")                 -- YAML
vim.lsp.enable("docker_language_server") -- Docker
vim.lsp.enable("pyright")                -- Python
vim.lsp.enable("phpactor")               -- PHP


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
