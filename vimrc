set nocompatible
set encoding=UTF-8
set t_Co=256
filetype on
filetype plugin on
filetype indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'mgee/lightline-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'alvan/vim-closetag'
Plugin 'TaDaa/vim-emmet-autocompleter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-commentary'
Plugin 'yggdroot/indentline'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ap/vim-css-color'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'godlygeek/csapprox'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Bundle 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/vis'
Plugin 'ryanoasis/vim-devicons'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jparise/vim-graphql'
Plugin 'mhinz/vim-sayonara'
Plugin 'majutsushi/tagbar'
Plugin 'Asheq/close-buffers.vim'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'hdima/python-syntax'

syntax on
set guifont=Meslo\ LG\ S\ Regular\ Nerd\ Font\ Complete\ Mono:h16
set omnifunc=syntaxcomplete#Complete
set showtabline=2
if has('gui_running')
    set guioptions=
endif


set colorcolumn=80
set cursorline
set linespace=0
set incsearch
set path=$PWD/**
set wildmenu
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
set hidden
set history=100
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set noswapfile
set ignorecase
set smartcase
set list listchars=tab:→\ ,trail:·
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

let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'filename': 'LightlineFilename',
            \ },
            \ }

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return WebDevIconsGetFileTypeSymbol() . filename . modified
endfunction

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'


let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#enable_devicons = 1

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()


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

au BufNewFile,BufRead *.html,*.php set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1


" Indent shortcuts
" for command mode
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv
" for insert mode
inoremap <S-Tab> <C-d>

nnoremap <Tab> >>
vnoremap <Tab> >gv
vnoremap < <gv
vnoremap > >gv

" Tab completion
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<C-cr>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Tab movement
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprev<CR>
nmap <Leader>w :Sayonara!<CR>
nmap <Leader>q :Sayonara<CR>
nnoremap <Leader>W :CloseOtherBuffers<CR>
" Indent shortcuts
" for command mode
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv
" for insert mode
inoremap <S-Tab> <C-d>

nnoremap <Tab> >>
vnoremap <Tab> >gv
:vnoremap < <gv
:vnoremap > >gv

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" indentLine Config
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_conceallevel = 1
let g:indentLine_leadingSpaceChar = '·'


" Tab completion
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<C-cr>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:ctrlp_max_files=0

" Lint Config
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['flake8']
            \}

" Tagbar configs
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autofocus = 1

nmap <Leader>/ :TagbarToggle<CR>

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nmap <Leader>t :new<CR>
nmap <Leader>` :terminal<CR>
tnoremap <Esc> <C-\><C-n>

let g:terminal_ansi_colors = ["#10346b", "#d61e1d", "#008924", "#aa8800", "#1562dd", "#be2fc7", "#008661", "#fafafa",
            \ "#10346b", "#d61e1d", "#008924", "#aa8800", "#1562dd", "#be2fc7", "#008661", "#fafafa"]

let python_highlight_all = 1


