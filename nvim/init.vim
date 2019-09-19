call plug#begin('~/.local/share/nvim/plugged')
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': './install.sh',
"    \ }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mattn/emmet-vim'
Plug 'git@github.com:Quramy/tsuquyomi.git'
" Plug 'git@github.com:Vimjas/vim-python-pep8-indent.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plug 'git@github.com:easymotion/vim-easymotion.git'
Plug 'git@github.com:fatih/vim-go.git'
Plug 'git@github.com:godlygeek/tabular.git'
Plug 'git@github.com:jeffkreeftmeijer/vim-numbertoggle'
Plug 'git@github.com:junegunn/vim-plug'
Plug 'git@github.com:leafgarland/typescript-vim.git'
Plug 'git@github.com:mikewest/vimroom.git'
Plug 'git@github.com:pangloss/vim-javascript.git'
Plug 'git@github.com:scrooloose/nerdtree.git'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'elixir-editors/vim-elixir'
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

autocmd FileType proto :setlocal noexpandtab
autocmd FileType python,java :setlocal sw=4 ts=4 sts=4
autocmd filetype crontab setlocal nobackup nowritebackup

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

map <Leader> <Plug>(easymotion-prefix)

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader><leader>d :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

autocmd FileType typescript nmap <buffer> <Leader><Leader>q : <C-u>TsuquyomiQuickFix<CR>
autocmd FileType typescript nmap <buffer> <Leader><Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType javascript nmap <buffer> <Leader><Leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType javascript set cino+=(0
autocmd FileType typescript set cino+=(0
let g:tsuquyomi_javascript_support = 1
autocmd FileType go nmap <Leader><Leader>t <Plug>(go-info)

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
