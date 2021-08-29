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
capabilities.textDocument.completion.completionItem.snippetSupport = true

-----------------------
-- Webdev
-----------------------
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client)
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            import_all_priorities = {
                buffers = 4, -- loaded buffer names
                buffer_content = 3, -- loaded buffer content
                local_files = 2, -- git files or files with relative path markers
                same_file = 1, -- add to existing import statement
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint_d",
            eslint_config_fallback = nil,
            eslint_enable_diagnostics = false,
            eslint_show_rule_id = false,

            -- formatting
            enable_formatting = false,
            formatter = "prettier",
            formatter_config_fallback = nil,

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        }

        -- required to fix code action ranges
        ts_utils.setup_client(client)
    end
}
lspconfig.cssls.setup {capabilities = capabilities}
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
lspconfig.html.setup {capabilities = capabilities}
lspconfig.tailwindcss.setup {}
lspconfig.svelte.setup {capabilities = capabilities}

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
