set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-bufferline'
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'ctrlpvim/ctrlp.vim'

syntax on
set guifont=Menlo\ Regular:h16
set colorcolumn=80
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

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
