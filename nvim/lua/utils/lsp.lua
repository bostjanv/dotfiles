local M = {}

---@param ft string
---@param command string
function M.setup_auto_format(ft, command)
    if not command then
        command = "lua vim.lsp.buf.formatting_sync()"
    end
    vim.cmd(string.format("autocmd BufWritePre *.%s %s", ft, command))
end

function M.disable_auto_format(ft)
    vim.cmd(string.format("autocmd! BufWritePre *.%s", ft))
end

function M.disable_auto_format_all()
    vim.cmd("autocmd! LspAutoFormat")
end

return M
