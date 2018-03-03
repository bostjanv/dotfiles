set nocompatible

filetype indent plugin on
syntax on

let mapleader=","

colorscheme badwolf " badwolf, compot, zenburn
set colorcolumn=90
set novisualbell
set noerrorbells
set guioptions=-Mt
set cursorline
set showmatch
set background=dark
set encoding=utf-8

set hidden
set wildmenu
set showcmd
set incsearch
set hlsearch
set lazyredraw
set showmatch

set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
"set ruler
set t_vb=
set number
highlight LineNr ctermfg=gray
"set cursorline
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>

" turn off line wrapping
set nowrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <C-L> :nohl<CR><C-L>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" leader is comma
let mapleader=","

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" vim
" highlight Cursor guifg=black guibg=green
" highlight iCursor guifg=black guibg=green
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10

" neovim
GuiFont Bitstream Vera Sans Mono:h11
