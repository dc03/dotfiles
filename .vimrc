syntax enable

if !has('gui_running')
    set t_Co=256
endif

filetype plugin indent on

set t_u7=
"set ambw=double
set nowrap
set encoding=UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set signcolumn=yes
set termguicolors
set colorcolumn=80,120
set backspace=indent,eol,start
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status/tab line options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set showtabline=2
set noshowmode

setlocal conceallevel=2
set concealcursor=nciv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocomplete settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,noinsert,noselect,preview
set pumheight=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-A> :TagbarToggle   <CR>
nnoremap <silent> <CR>  :nohlsearch     <CR><CR>
nnoremap <silent> <leader>f :NERDTreeToggle <CR>
nnoremap <silent> <C-]> :Lexplore!      <CR>

nnoremap <silent> ge :LspDocumentDiagnostics <CR>
nnoremap <silent> gd :LspDefinition          <CR>
nnoremap <silent> gr :LspReferences          <CR>
nnoremap <silent> gk :LspHover               <CR>
nnoremap <f2> :LspRename                     <CR>
nnoremap <silent> ga :LspWorkspaceSymbol     <CR>
nnoremap <silent> gl :LspDocumentSymbol      <CR>
nnoremap <silent> gx :SemanticHighlight      <CR>
"nnoremap <silent> gx :LspCxxHighlight      <CR>
nnoremap <silent> gf :FormatCode             <CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"

imap jj <ESC>
imap jjw <ESC>:wa<RETURN>
imap jjwq <ESC>:wqa<RETURN>

map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the <leader> key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 15

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_hightlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow-parentheses options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctags_statusline = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline#bufferline#show_number = 1
let g:ligthline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['gitbranch', 'readonly', 'filename', 'modified']
            \     ],
            \     'right': [
            \         ['linter_errors', 'linter_warnings', 'linter_ok'],
            \         ['lineinfo'],
            \         ['fileformat', 'fileencoding', 'filetype', 'percent']
            \     ]
            \ },
            \ 'tabline': {
            \     'left': [ ['buffers'] ],
            \     'right': [  ]
            \ },
            \ 'component': {
		    \     'lineinfo': ' %3l:%-2v',
		    \ },
            \ 'component_expand': {
            \     'buffers': 'lightline#bufferline#buffers',
            \     'linter_warnings': 'lightline_lsp#warnings',
            \     'linter_errors': 'lightline_lsp#errors',
            \     'linter_ok': 'lightline_lsp#ok',
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
            \     'gitbranch': 'FugitiveHead',
            \     'readonly': 'LightlineReadonly',
		    \     'fugitive': 'LightlineFugitive'
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LightlineReadonly()
		return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight.lsRanges = true
" is only necessary if vim doesn't have +byte_offset
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_min_chars = 1

"let g:deoplete#enable_at_startup = 1
" ale options
" let g:ale_linters = {
" \   'cpp': ['clangd'],
" \   'c': ['clangd'],
" \}
"
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"
" "set completeopt=menu,menuone,preview,noselect,noinsert
" "let g:ale_completion_enabled = 1
" let g:ale_cpp_cc_options = '-Wall -Wextra -Wpedantic -std=c++20 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/x86_64-linux-gnu -I/usr/include/c++/11'
" let g:ale_cpp_clang_options = '-Wall -Wextra -Wpedantic -std=c++20 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/x86_64-linux-gnu -I/usr/include/c++/11'
" let g:ale_cpp_ccls_options = '-Wall -Wextra -Wpedantic -std=c++20 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/x86_64-linux-gnu -I/usr/include/c++/11'
" let g:ale_cpp_gcc_options = '-Wall -Wextra -Wpedantic -std=c++20 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/x86_64-linux-gnu -I/usr/include/c++/11'
" let g:ale_cpp_clangtidy_options = '-Wall -Wextra -Wpedantic -std=c++20 -I/usr/include/x86_64-linux-gnu/c++/11 -I/usr/include/x86_64-linux-gnu -I/usr/include/c++/11'
" let g:ale_cpp_clangtidy_checks = ['*,-cppcoreguidelines-explicit-virtual-functions,-hicpp-use-override,-fuchsia-*,-google-*,-zircon-*,-abseil-*,-modernize-use-trailing-return-type,-llvm-*,-llvmlibc-*,-modernize-use-override']
" let g:ale_cpp_clangcheck_executable = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slime options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimtex options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let localleader = ','
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-shell-escape' ,
      \   '-verbose' ,
      \   '-file-line-error',
      \   '-synctex=1' ,
      \   '-interaction=nonstopmode' ,
      \ ],
      \}

"let g:everforest_background = 'soft'
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_semantic_enabled = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    " refer to doc to add more commands
endfunction

let g:tagbar_width = max([20, winwidth(0) / 6])
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.vim/autoload/plug.vim

call plug#begin('~/.vim/plugged')

"Plug 'ervandew/supertab'
"Plug 'ap/vim-buftabline'
Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}
Plug 'universal-ctags/ctags'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'ActivityWatch/aw-watcher-vim'

" vim layout
Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'

" Clang-format
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'

" Editing help
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'ddollar/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Colors and themes
"Plug 'sainnhe/everforest'
"Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ap/vim-css-color'
Plug 'lifepillar/vim-solarized8'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp', 'c']}
Plug 'shirk/vim-gas', {'for': ['s', 'asm']}
Plug 'habamax/vim-rst'
Plug 'jaxbot/semantic-highlight.vim'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'

" LSP and autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'halkn/lightline-lsp'
"Plug 'dense-analysis/ale', {'for': ['cpp', 'c']}
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme one

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd vimenter * exe 'silent! botright 10 split temp'
" autocmd vimenter * vertical terminal ++rows=15 ++curwin
" autocmd vimenter * bd temp
autocmd vimenter * RainbowParentheses
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd vimenter * filetype detect
autocmd vimenter *.ll set filetype=llvm
autocmd vimenter CMakeLists.txt syntax enable

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LLVM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LLVM Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile,
" so it's important to categorize them as such.
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/syntax/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/syntax/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Enable syntax highlighting for reStructuredText files. To use, copy
" rest.vim (http://www.vim.org/scripts/script.php?script_id=973)
" to ~/.vim/syntax .
augroup filetype
 au! BufRead,BufNewFile *.rst     set filetype=rest
augroup END


