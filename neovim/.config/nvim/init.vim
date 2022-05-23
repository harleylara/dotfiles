set nocompatible

syntax enable

set scrolloff=8
set number
set relativenumber
set hidden
set tabstop=4 softtabstop=4
set colorcolumn=80
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" ------------------------------------------------
" KEY MAPS
" ------------------------------------------------

let mapleader = " "

nmap <leader>ve :edit ~/dotfiles/neovim/.config/nvim/init.vim<CR>
nmap <leader>vr :source ~/dotfiles/neovim/.config/nvim/init.vim<CR>

" save file
nmap <leader>s :w<CR>

" save and quit
nmap <leader>wq :wq<CR>

nnoremap <leader>pv :Vex<CR> 
nnoremap <leader>pf :Files<CR>

map gf :edit <cfile><CR>

" ------------------------------------------------
" PLUGINS 
" ------------------------------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim''
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Language server for Neovim
Plug 'neovim/nvim-lspconfig'
Plug 'lukas-reineke/lsp-format.nvim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" LuaSnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" light-weight lsp UI
Plug 'glepnir/lspsaga.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

" Python relate stuff
" Plug 'vim-scripts/indentpython.vim'

" Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'wikitopian/hardmode'

" Vim config for Rust
Plug 'rust-lang/rust.vim'

" Rust set if tools, To enable more of the features of rust-analyzer, such as
" inlay hints and more! 
Plug 'simrat39/rust-tools.nvim'

" Theme
Plug 'ayu-theme/ayu-vim'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

call plug#end()


" ------------------------------------------------
" IMPORT LUA INIT
" ------------------------------------------------
lua require('harleylara.init')


" ------------------------------------------------
" YANK highlight setup
" ------------------------------------------------
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
augroup END

" ------------------------------------------------
" COLOR SCHEME 
" ------------------------------------------------
set termguicolors     " enable true colors support
let ayucolor="dark"  " for light version of theme
colorscheme ayu
highlight LineNr guibg=#000000
highlight LineNr guifg=#565B66

" ------------------------------------------------
" NERDTree 
" ------------------------------------------------
let NERDTreeQuitOnOpen=1
nmap <leader>t :NERDTreeToggle<CR>

" ------------------------------------------------
" EMMET
" ------------------------------------------------
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" ------------------------------------------------
" PYTHON
" ------------------------------------------------
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix
    \set encoding=utf-8
    \

" ------------------------------------------------
" HARDMODE
" ------------------------------------------------
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
