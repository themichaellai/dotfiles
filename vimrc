set autoindent
set nu
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
au BufNewFile,BufRead *.ejs set filetype=html

highlight ErrorMsg ctermbg=red guibg=red
call matchadd('ErrorMsg', '\s\+$')
call matchadd('ErrorMsg', '\%>80v.\+')

autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1

autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('ErrorMsg', '\s\+$') | endif
autocmd WinEnter * if !exists('w:created') | let w:m2= matchadd('ErrorMsg', '\%>80v.\+') | endif

call pathogen#infect()
