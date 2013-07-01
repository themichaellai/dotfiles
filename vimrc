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

autocmd FileType python,html,htmldjango,java :setlocal sw=4 ts=4 sts=4

map ; :NERDTreeToggle<CR><CR>

call pathogen#infect()
