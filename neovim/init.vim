" //////////////////// initial config
syntax on						                " enable syntax highlighting
set nocompatible					                " no compatible with vim
set showmatch						                " enable matching
set ignorecase						                " disable case sensitive
set mouse=v                                         			" paste with the middle click mouse (press scroll)
set hlsearch						                " highlight search
set incsearch						                " incremental search
set number						                " enable line numbers
set mouse=a						                " enable mouse clicking
set nowrap						                " disable wrap
set noswapfile						                " disable create swap file

" //////////////////// vim plug config
call plug#begin("~/.config/nvim/autoload/plugged")

" install themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }			" material theme	

" install visual tools
Plug 'itchyny/lightline.vim'						" bottom status bar

" install syntax support
Plug 'pangloss/vim-javascript'						" js syntax support
Plug 'cespare/vim-toml', { 'branch': 'main' }				" toml support

call plug#end()

" //////////////////// visual customization
colo material
let g:material_theme_style = 'darker'
let g:lightline = { 'colorscheme': 'material_vim' }
