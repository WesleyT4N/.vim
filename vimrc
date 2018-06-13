set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'

syntax on
set guifont=Menlo\ Regular:h16
set colorcolumn=81
set number
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>
set showmatch

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

autocmd vimenter * NERDTree
colorscheme one

set background=light
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
set laststatus=2
let NERDTreeShowHidden=1
nmap <leader>\ :NERDTreeToggle<CR>
