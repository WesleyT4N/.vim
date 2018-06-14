set nocompatible
filetype on
filetype plugin on
filetype indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" Plugins
Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'alvan/vim-closetag'
Plugin 'TaDaa/vim-emmet-autocompleter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-syntastic/syntastic'

syntax on
set guifont=Menlo\ Regular:h16
set guioptions-=e
set showtabline=2
set colorcolumn=80
set cursorline
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set list listchars=tab:→\ ,trail:·
set list
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>
set showmatch

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

colorscheme one

set background=light
set noshowmode

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
set laststatus=2
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <leader>\ :NERDTreeToggle<CR>

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.php,*.ts set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1

" Tab movement
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>

" Nerdcomment settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
:let g:syntastic_loc_list_height=5

" Indent shortcuts
" for command mode
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

nnoremap <Tab> >>
vnoremap <Tab> >>
