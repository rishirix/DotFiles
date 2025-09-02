set number
set relativenumber
set termguicolors
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
syntax on
set showmatch

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set ignorecase
set smartcase
set hlsearch
set incsearch

set clipboard=unnamedplus

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme candy
