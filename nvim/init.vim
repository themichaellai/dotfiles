call plug#begin('~/.local/share/nvim/plugged')
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': './install.sh',
"    \ }
Plug 'mattn/emmet-vim'
Plug 'git@github.com:Vimjas/vim-python-pep8-indent.git'
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
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

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
set guicursor=
set diffopt=internal,filler,closeoff,iwhite

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

autocmd FileType typescript nmap <buffer> <Leader><Leader>t : call CocAction('doHover')<CR>
autocmd FileType typescriptreact nmap <buffer> <Leader><Leader>t : call CocAction('doHover')<CR>
autocmd FileType javascript set cino+=(0
autocmd FileType typescript set cino+=(0
let g:tsuquyomi_javascript_support = 1
autocmd FileType go nmap <Leader><Leader>t <Plug>(go-info)

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader><leader>ac  <Plug>(coc-codeaction)
hi CocInlayHint guifg=#666666 guibg=NONE ctermfg=246 ctermbg=NONE

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

" https://vi.stackexchange.com/questions/3848/how-to-get-the-current-byte-offset-in-whole-file/3850
function! FileOffset()
    return line2byte(line('.')) + col('.') - 1
endfunction

let g:copilot_filetypes = { 'vim': v:false }
let b:copilot_enabled=v:true
