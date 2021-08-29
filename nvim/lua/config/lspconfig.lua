local lspconfig = require 'lspconfig'
local setup_auto_format = require('utils.lsp').setup_auto_format

vim.api.nvim_command('augroup LspAutoFormat')
vim.api.nvim_command('autocmd!')
setup_auto_format("rs")
setup_auto_format("cpp")
setup_auto_format("hpp")
setup_auto_format("c")
setup_auto_format("h")
setup_auto_format("js")
setup_auto_format("css")
setup_auto_format("py")
setup_auto_format("lua")
vim.api.nvim_command('augroup END')

local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-----------------------
-- json
-----------------------
lspconfig.jsonls.setup {
    capabilities = capabilities,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}

-----------------------
-- html
-----------------------
lspconfig.html.setup {capabilities = capabilities}

-----------------------
-- Lua
-----------------------
local luadev = require("lua-dev").setup({
    lspconfig = {cmd = {"lua-language-server"}}
})
require'lspconfig'.sumneko_lua.setup(luadev)

-----------------------
-- C++
-----------------------
lspconfig.clangd.setup {capabilities = capabilities}

-----------------------
-- Python
-----------------------
lspconfig.pyright.setup {capabilities = capabilities}

vim.lsp.handlers['textDocument/codeAction'] =
    require'lsputil.codeAction'.code_action_handler

-- vim.lsp.handlers['textDocument/references'] =
--     require'lsputil.locations'.references_handler
-- vim.lsp.handlers['textDocument/definition'] =
--     require'lsputil.locations'.definition_handler
-- vim.lsp.handlers['textDocument/declaration'] =
--     require'lsputil.locations'.declaration_handler
-- vim.lsp.handlers['textDocument/typeDefinition'] =
--     require'lsputil.locations'.typeDefinition_handler
-- vim.lsp.handlers['textDocument/implementation'] =
--     require'lsputil.locations'.implementation_handler
-- vim.lsp.handlers['textDocument/documentSymbol'] =
--     require'lsputil.symbols'.document_handler
-- vim.lsp.handlers['workspace/symbol'] =
--     require'lsputil.symbols'.workspace_handler
