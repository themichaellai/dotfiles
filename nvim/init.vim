call plug#begin('~/.local/share/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()

set nu
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ruler
set splitbelow
set splitright
set nofoldenable
set backspace=indent,eol,start
set guicursor=
set noincsearch
set number relativenumber

colorscheme tomorrow-night-eighties


setlocal omnifunc=syntaxcomplete#Complete

set nocompatible
filetype off
filetype plugin indent on

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

highlight ErrorMsg ctermbg=red guibg=red
call matchadd('ErrorMsg', '\s\+$')
" call matchadd('ErrorMsg', '/\%80v.\+/')
" set cc=80
highlight ColorColumn ctermbg=000
let &colorcolumn=join(range(81,81),",")
" set list
" set listchars=tab:▸\ ,trail:·,eol:¬

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

autocmd FileType python,java :setlocal sw=4 ts=4 sts=4

if (has("termguicolors"))
 set termguicolors
endif

" LanguageClient config start
" Required for operations modifying multiple buffers like rename.
set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"    \ 'javascript': ['javascript-typescript-stdio'],
"    \ }

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"
" LanguageClient config end
