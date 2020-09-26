syntax enable

if !has('gui_running')
    set t_Co=256
endif

filetype plugin indent on

set t_u7=
set ambw=double

" tab options
set expandtab
set shiftwidth=4
set tabstop=4

" set the numbering
set number
set relativenumber

" miscellaneous
set background=dark
set signcolumn=yes
set termguicolors
set colorcolumn=80,120
set backspace=indent,eol,start

" search options
set incsearch
set hlsearch

" status/tab line options
set laststatus=2
set showtabline=2
set noshowmode

setlocal conceallevel=2
set concealcursor=nciv

source ~/.vim/autoload/vim-plug/plug.vim

" Keybindings
nnoremap <silent> <C-N> :bnext          <CR>
nnoremap <silent> <C-B> :bprev          <CR>
nnoremap <silent> <C-A> :TagbarToggle   <CR>
nnoremap <silent> <CR>  :nohlsearch     <CR><CR>
nnoremap <silent> <C-]> :Vexplore       <CR>
nnoremap <silent> <C-\> :Vexplore!      <CR>

imap jk <ESC>
imap jkw <ESC>:wa<RETURN>
imap jkwq <ESC>:wqa<RETURN>

" Set the <leader> key
let mapleader = "["

" netrw options
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 50

" vim-cpp-enhanced-highlight options
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_hightlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" rainbow-parentheses options
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" ctags options
let g:ctags_statusline = 1

" lightline options
let g:lightline#bufferline#show_number = 1
let g:ligthline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['gitbranch', 'readonly', 'filename', 'modified']
            \     ],
            \     'right': [
            \         [ 'linter_checking', 'linter_errors',
            \            'linter_warnings', 'linter_infos', 'linter_ok'],
            \         ['lineinfo'],
            \         ['fileformat', 'fileencoding', 'filetype', 'percent']
            \     ]
            \ },
            \ 'tabline': {
            \     'left': [ ['buffers'] ],
            \     'right': [ ['close'] ]
            \ },
            \ 'component_expand': {
            \     'buffers': 'lightline#bufferline#buffers',
            \     'linter_checking': 'lightline#ale#checking',
            \     'linter_infos': 'lightline#ale#infos',
            \     'linter_warnings': 'lightline#ale#warnings',
            \     'linter_errors': 'lightline#ale#errors',
            \     'linter_ok': 'lightline#ale#ok',
            \ },
            \ 'component_type': {
            \     'buffers': 'tabsel',
            \     'linter_checking': 'right',
            \     'linter_infos': 'right',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'right',
            \ },
            \ 'component_function': {
            \     'gitbranch': 'FugitiveHead'
            \ },
            \ }

" ale options
let g:ale_cpp_cc_options = '-Wall -Wextra -Wpedantic -std=c++17'
let g:ale_cpp_clang_options = '-Wall -Wextra -Wpedantic -std=c++17'
let g:ale_cpp_gcc_options = '-Wall -Wextra -Wpedantic -std=c++17'
let g:ale_cpp_clangtidy_options = '-Wall -Wextra -Wpedantic -std=c++17'
let g:ale_cpp_clangtidy_checks = ['*,-fuchsia-*,-google-*,-zircon-*,-abseil-*,-modernize-use-trailing-return-type,-llvm-*']

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}
Plug 'dense-analysis/ale', {'for': ['cpp', 'c']}
Plug 'jiangmiao/auto-pairs'
Plug 'universal-ctags/ctags'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale', {'for': ['cpp', 'c']}
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ddollar/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
"Plug 'ap/vim-buftabline'
Plug 'google/vim-codefmt', {'for': ['cpp', 'c']}
Plug 'google/vim-maktaba', {'for': ['cpp', 'c']}
Plug 'google/vim-glaive', {'for': ['cpp', 'c']}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'
Plug 'shirk/vim-gas'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

colo gruvbox

" autocmd vimenter * exe 'silent! botright 10 split temp'
" autocmd vimenter * vertical terminal ++rows=15 ++curwin
" autocmd vimenter * bd temp
autocmd vimenter * RainbowParentheses
