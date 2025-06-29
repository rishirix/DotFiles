set nu
set clipboard=unnamedplus
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let g:airline_theme='angr'
