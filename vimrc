colorscheme one
set showtabline=4
if has('gui_running')
    set guioptions=
endif
set mouse=a

set termguicolors
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
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
set showmatch
set number relativenumber
set guifont=Meslo\ LG\ S\ Regular\ Nerd\ Font\ Complete\ Mono:h16
set noshowmode
set background=light

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#number_map = {
\ 0: '0 ', 1: '1 ', 2: '2 ', 3: '3 ', 4: '4 ',
\ 5: '5 ', 6: '6 ', 7: '7 ', 8: '8 ', 9: '9 '}
let g:lightline#bufferline#enable_devicons = 1
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return WebDevIconsGetFileTypeSymbol() . ' ' . filename . modified
endfunction

set laststatus=2
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <leader>\ :NERDTreeToggle<CR>

set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c set tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ fileformat=unix
            \ colorcolumn=120

au BufNewFile,BufRead *.html,*.php set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2

au BufReadPost,BufNewFile *.js set filetype=javascript.jsx
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ colorcolumn=120

au BufNewFile,BufRead *.gql.js set filetype=graphql
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4

au BufNewFile,BufRead *.tex set tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
            \ colorcolumn=80

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

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nmap <Leader>t :enew<CR>
nmap <Leader>` :10Term<CR>
tnoremap <Esc> <C-\><C-n>

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

let g:terminal_color_0  = "#000000"
let g:terminal_color_8  = "#000000"
let g:terminal_color_1  = "#d51e1d"
let g:terminal_color_9  = "#d51e1d"
let g:terminal_color_2  = "#008923"
let g:terminal_color_10 = "#008923"
let g:terminal_color_3  = "#aa8800"
let g:terminal_color_11 = "#aa8800"
let g:terminal_color_4  = "#1561dc"
let g:terminal_color_12 = "#1561dc"
let g:terminal_color_5  = "#be2ec7"
let g:terminal_color_13 = "#be2ec7"
let g:terminal_color_6  = "#008661"
let g:terminal_color_14 = "#008661"
let g:terminal_color_7  = "#f9faf9"
let g:terminal_color_15 = "#f9faf9"


let g:polyglot_disabled = ['latex']
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

set splitbelow
" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#enable_smart_case = 1

set conceallevel=2
set concealcursor=niv
let g:tex_conceal = ""
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
      \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
smap <silent><CR> <Plug>(neosnippet_jump_or_expand)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['bg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['bg', 'Normal'],
  \ 'marker':  ['fg', 'Normal'],
  \ 'spinner': ['fg', 'Normal'],
  \ 'header':  ['fg', 'Normal'] }

nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>P :Ag<CR>
