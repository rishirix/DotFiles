set number
set termguicolors
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
syntax on
filetype plugin indent on
set clipboard=unnamedplus


call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'

call plug#end()

let NERDTreeShowHidden=1
let g:airline_theme='distinguished'
colorscheme distill

nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd FileType c nnoremap <F5> :w<CR>:!gcc % -o %:r && ./%:r<CR>
autocmd FileType cpp nnoremap <F5> :w<CR>:!g++ % -o %:r && ./%:r<CR>
autocmd FileType python nnoremap <F5> :w<CR>:!python3 %<CR>
autocmd FileType sh nnoremap <F5> :w<CR>:!bash %<CR>
