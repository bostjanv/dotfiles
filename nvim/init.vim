" Vim scripting cheatsheet
" https://devhints.io/vimscript


filetype off
set nocompatible

call plug#begin('~\vimfiles\plugged')
Plug 'scrooloose/nerdtree'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Root the project dir to folder w/ .git if applicable
Plug 'airblade/vim-rooter'
" Nice colorscheme based on Visual Studio dark
Plug 'tomasiser/vim-code-dark'
call plug#end()

" Enable built-in matchit plugin
runtime macros/matchit.vim

set hidden                        " Don't unload buffers when leaving them

" colors & fonts
set termguicolors
set background=dark
" colorscheme pablo
" colorscheme codedark
colorscheme jellybeans
" neovim-qt.exe: suppres warning about bad fixed pitched metric
if has('win32')
    set guifont=Cascadia\ Mono:h11
else
    set guifont=Input\ Mono:h11
endif

set list                          " Show some more characters
set listchars=tab:▸\              " Char representing a tab
set listchars+=extends:❯          " Char representing an extending line
set listchars+=nbsp:␣             " Non breaking space
set listchars+=precedes:❮         " Char representing an extending line in the other direction
set listchars+=trail:·            " Show trailing spaces as dots

filetype plugin indent on
syntax enable

" indentation
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

" Sane splits
set splitright
set splitbelow

set number
set relativenumber
set cursorline

set nospell
set noswapfile

set wrap                          " Wrap long lines
set fillchars+=vert:\             " Don't show pipes in vertical splits

let NERDTreeQuitOnOpen = 1
let $FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs | rg -v \"(^|/)target/\""

"
" mappings
"

" leader
let mapleader = "\<Space>"

" toggle between buffers
nnoremap <leader><leader> <c-^>
" open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>h :nohlsearch<cr>

nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>s :Rg<cr>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

"
" coc settings
"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" end of coc settings

" escape from terminal
tnoremap <Esc> <C-\><C-n>

augroup mygroup
    autocmd!

    " configure indentation for Rust
    autocmd FileType rust set expandtab tabstop=4 softtabstop=4 shiftwidth=4

    " configure indentation for Python
    autocmd FileType python set expandtab tabstop=4 softtabstop=4 shiftwidth=4

    " save file and run rustfmt on enter
    autocmd FileType rust nnoremap <buffer> <cr> :w<cr>:RustFmt<cr>:w<cr>

    " save file and run rustfmt on enter
    autocmd FileType c,cpp nnoremap <buffer> <cr> :w<cr>:ClangFormat<cr>:w<cr>
augroup end
