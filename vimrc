call pathogen#infect()
set nu
syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set ruler
au BufNewFile,BufRead *.ejs set filetype=html
set splitbelow
set splitright
set nofoldenable
set backspace=indent,eol,start

set noesckeys

filetype on
filetype plugin on
filetype indent on

" command IndentOn * filetype on * filetype plugin on * filetype indent on

highlight ErrorMsg ctermbg=red guibg=red
call matchadd('ErrorMsg', '\s\+$')
" call matchadd('ErrorMsg', '/\%80v.\+/')
" set cc=80
highlight ColorColumn ctermbg=000
let &colorcolumn=join(range(81,81),",")
" set list
" set listchars=tab:▸\ ,trail:·,eol:¬

let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.md set filetype=markdown

autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1

autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('ErrorMsg', '\s\+$') | endif
" autocmd WinEnter * if !exists('w:created') | let w:m2= matchadd('ErrorMsg', '\%>80v.\+') | endif

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

autocmd FileType python,java :setlocal sw=4 ts=4 sts=4

map <Leader> <Plug>(easymotion-prefix)

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader><leader>d :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

let g:EditorConfig_core_mode = 'external_command'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


" set langmap='q,\\,w,.e,pr,yt,fy,gu,ci,ro,lp,/[,=],aa,os,ed,uf,ig,dh,hj,tk,nl,s\\;,-',\\;z,qx,jc,kv,xb,bn,mm,w\\,,v.,z/,[-,]=,\"Q,<W,>E,PR,YT,FY,GU,CI,RO,LP,?{,+},AA,OS,ED,UF,IG,DH,HJ,TK,NL,S:,_\",:Z,QX,JC,KV,XB,BN,MM,W<,V>,Z?
