local nnoremap = function(lhs, rhs, silent)
    vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = silent})
end

local inoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, {noremap = true})
end

local inosilentexprremap = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, {noremap = true, expr=true, silent=true})
end

local vnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap('v', lhs, rhs, {noremap = true})
end

-- smartquit
nnoremap('qq', '<cmd>lua require("utils/smartquit")()<CR>', true)

-- Use alt + hjkl to resize windows
nnoremap('<M-j>', ':resize -2<CR>')
nnoremap('<M-k>', ':resize +2<CR>')
nnoremap('<M-h>', ':vertical resize -2<CR>')
nnoremap('<M-l>', ':vertical resize +2<CR>')

-- Escape redraws the screen and removes any search highlighting.
nnoremap('<esc>', ':noh<return><esc>')

-- Easy CAPS
inoremap('<c-u>', '<ESC>viwUi')

-- TAB in normal mode will move to next buffer
nnoremap('<TAB>', ':bnext<CR>')
-- SHIFT-TAB will go back
nnoremap('<S-TAB>', ':bprevious<CR>')
-- Close buffer
nnoremap('<Leader>c', ':BufDel<CR>')

-- Better tabbing
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Better window navigation
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

-- Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap('<C-w>', '<C-\\><C-o>dB')
inoremap('<C-BS>', '<C-\\><C-o>db')

-- Symbols Outline
--nnoremap('<Leader>s', ':SymbolsOutline<CR>')

-- Ranger
-- nnoremap('<C-s>', ':RnvimrToggle<CR>')

-- WhichKey
nnoremap('<leader>', ':WhichKey \'<Space>\'<CR>', true)

-- Com(entary)
nnoremap('<space>/', ' :Commentary<CR>')
vnoremap('<space>/', ' :Commentary<CR>')

-- Nvim-Tree
-- nnoremap('<C-n>', ':NvimTreeToggle<CR>')
-- nnoremap('<leader>r', ':NvimTreeRefresh<CR>')
-- nnoremap('<leader>n', ':NvimTreeFindFile<CR>')

-- NERDTree
nnoremap('<C-n>', ':NERDTreeToggle<CR>')

-- Compe
inosilentexprremap("<C-Space>", "compe#complete()")
inosilentexprremap("<CR>",
         "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))")
inosilentexprremap("<C-e>", "compe#close('<C-e>')")
inosilentexprremap("<C-f>", "compe#scroll({ 'delta': +4 })")
inosilentexprremap("<C-d>", "compe#scroll({ 'delta': -4 })")

-- LSP
nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', true)
nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', true)
nnoremap('gr', '<cmd>LspTrouble lsp_references<CR>', true)
nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', true)
nnoremap('<C-space>', '<cmd>lua vim.lsp.buf.hover()<CR>', true)
nnoremap('ge', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', true)
nnoremap('gE', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', true)
nnoremap('<silent><leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', true)
nnoremap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', true)
nnoremap('<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', true)
vnoremap('<Leader>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
nnoremap('<Leader>ld', '<cmd>LspTrouble lsp_definitions<CR>', true)
nnoremap('<Leader>le',
         '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', true)
nnoremap('<Leader>lE', '<cmd>LspTroubleWorkspaceToggle<CR>', true)
nnoremap('<Leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', true)
vnoremap('<Leader>ff', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')


vim.api.nvim_command('autocmd FileType c,cpp nnoremap <buffer> <C-h> :ClangdSwitchSourceHeader<CR>')
--vim.api.nvim_command('autocmd BufEnter NERD_tree_* nnoremap <buffer> <TAB> <TAB>')
vim.api.nvim_command('autocmd FileType nerdtree nnoremap <buffer> <TAB> <C-W>W')

-- Telescope
nnoremap('<C-f>', ':lua require("utils/telescope").search_files()<CR>')
--nnoremap('<C-f>', ':lua require("utils/telescope").search_in_buffer()<CR>')
inoremap('<C-f>', '<Esc> :lua require("utils/telescope").search_in_buffer()<CR>')
-- nnoremap('<Leader>fg', '<Esc> :lua require("telescope.builtin").live_grep()<CR>')
nnoremap('<C-s>', '<Esc> :lua require("telescope.builtin").live_grep()<CR>')
-- nnoremap('<Leader>fd',
--          '<Esc> :lua require("utils/telescope").search_dotfiles()<CR>')
nnoremap('<Leader>b', ':lua require("telescope.builtin").buffers()<CR>')
