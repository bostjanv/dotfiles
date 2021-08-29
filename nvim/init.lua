-- https://github.com/simrat39/dotfiles

require('general')
require('mappings')
require('plugins')
require('commands')
--require('statusline')

--require('config/bufferline')
require('config/compe')
require('config/flutter-tools')
require('config/lspconfig')
require('config/nvim-autopairs')
require('config/nvim-colorizer')
require('config/nvim-tree')
require('config/nvim-ts-autotag')
require('config/rust-tools')
require('config/telescope')
require('config/tree-sitter')
require('config/nerdtree')

vim.cmd "colorscheme gruvbox"
vim.opt.guifont='FiraCodeNerdFont'

