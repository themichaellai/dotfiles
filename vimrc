set autoindent
set nu
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
au BufNewFile,BufRead *.ejs set filetype=html
set splitbelow
set splitright

" filetype on
" filetype plugin on
" filetype indent on

" command IndentOn * filetype on * filetype plugin on * filetype indent on

highlight ErrorMsg ctermbg=red guibg=red
call matchadd('ErrorMsg', '\s\+$')
" call matchadd('ErrorMsg', '/\%80v.\+/')
" set cc=80
" highlight ColorColumn ctermbg=000
" let &colorcolumn=join(range(81,999),",")

autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1

autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('ErrorMsg', '\s\+$') | endif
" autocmd WinEnter * if !exists('w:created') | let w:m2= matchadd('ErrorMsg', '\%>80v.\+') | endif

autocmd FileType python,java :setlocal sw=4 ts=4 sts=4

nnoremap <leader>d :NERDTreeToggle<CR>

call pathogen#infect()
