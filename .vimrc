set nocompatible
set nowrap
set encoding=UTF-8

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'BufOnly.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/vim-gitbranch'
Plugin 'itchyny/lightline.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'blueyed/smarty.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on


syntax on
colorscheme industry
set number
set tabstop=4
set softtabstop=4
set expandtab
set showcmd
set shiftwidth=4
set statusline+=%F
set smarttab
set hlsearch
set mouse=a
set smartcase
set ignorecase
set incsearch
set showmatch
set matchtime=0
set autoindent
filetype indent on
set showmatch
set directory^=$HOME/.vim/tmp//
set vb
set laststatus=2
set visualbell
set t_vb=

hi Normal guibg=NONE ctermbg=NONE

let g:elite_mode=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \}
    \}

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" tmux fixes
if exists('$TMUX')
    hi Search cterm=NONE ctermfg=grey ctermbg=blue
endif

" Neocomplete settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_statup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell.hist',
    \ 'scheme' : $home.'/.gosh:completions'
    \}
if !exists('g:neocmoplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'

function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
endfunction

inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" key map
nnoremap j gj
nnoremap k gk
map <C-n> :NERDTreeToggle<CR>
imap <C-Enter> <Esc>o
imap <C-S-Enter> <Esc>O
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" Neocomplete plugin mappings
inoremap <expr><C-g>    neocomplete#undo_completion()
inoremap <expr><C-l>    neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-h>    neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>     neocomplete#smart_close_popup()."\<C-h>"

" Resize split with arrowkeys

if get(g:, 'elite_mode')
    nnoremap <Up>   :resize +2<CR>
    nnoremap <Down> :resize -2<CR>
    nnoremap <Left> :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

au Filetype html,xhtml,xml,smarty source ~/.vim/scripts/wrapwithtag.vim
