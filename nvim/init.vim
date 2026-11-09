call plug#begin('~/.local/share/nvim/plugged')
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': './install.sh',
"    \ }
Plug 'mattn/emmet-vim'
Plug 'git@github.com:Vimjas/vim-python-pep8-indent.git'
Plug 'git@github.com:airblade/vim-gitgutter.git', { 'commit': '488c055' }
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git', { 'commit': '475a864' }
Plug 'git@github.com:easymotion/vim-easymotion.git', { 'commit': 'b3cfab2' }
" Plug 'git@github.com:fatih/vim-go.git'
Plug 'git@github.com:godlygeek/tabular.git'
Plug 'git@github.com:jeffkreeftmeijer/vim-numbertoggle'
Plug 'git@github.com:junegunn/vim-plug'
Plug 'git@github.com:leafgarland/typescript-vim.git'
Plug 'git@github.com:mikewest/vimroom.git'
Plug 'git@github.com:pangloss/vim-javascript.git'
Plug 'git@github.com:scrooloose/nerdtree.git'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-fugitive', { 'commit': '61b51c0' }
" Plug 'github/copilot.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-orgmode/orgmode'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ '@yaegassy/coc-tailwindcss3',
  \ 'coc-pyright',
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
set mouse=
set textwidth=0
set wrapmargin=0
set formatoptions-=t

colorscheme tomorrow-night-eighties


setlocal omnifunc=syntaxcomplete#Complete

augroup rust_indent
  autocmd!
  autocmd FileType rust setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

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
autocmd FileType markdown :setlocal linebreak

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
" autocmd FileType typescript set cino+=(0
let g:tsuquyomi_javascript_support = 1
autocmd FileType go nmap <Leader><Leader>t <Plug>(go-info)
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4


" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
" https://github.com/neoclide/coc.nvim/issues/1405#issuecomment-1477886794
" function! ShowDocumentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif CocAction('hasProvider', 'hover')
"     if coc#float#has_float()
"       call coc#float#jump()
"       nnoremap <buffer> q <Cmd>close<CR>
"     else
"       call CocActionAsync('doHover')
"     endif
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction
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

" let b:copilot_enabled=v:true
let g:copilot_filetypes = { 'vim': v:false, 'markdown': v:false }

lua << EOF
require('orgmode').setup({
  org_agenda_files = '~/orgfiles/**/*',
  org_default_notes_file = '~/orgfiles/refile.org',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'org',
  callback = function()
    vim.keymap.set('i', '<M-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
      buffer = true,
    })
  end,
})

-- :'<,'>MarkdownCopy — copy selection wrapped in a fenced code block,
-- followed by "from <repo-relative-path>:<lines>", to the system clipboard.
vim.api.nvim_create_user_command("MarkdownCopy", function(opts)
  local line1, line2 = opts.line1, opts.line2
  local lines = vim.api.nvim_buf_get_lines(0, line1 - 1, line2, false)

  -- If the last visual selection was char-wise, trim the first/last lines
  -- to the actual selected columns. Line-wise ('V') and block-wise are left as-is.
  if vim.fn.visualmode() == "v" and #lines > 0 then
    local col1 = vim.fn.getpos("'<")[3]
    local col2 = vim.fn.getpos("'>")[3]
    -- 'selection=exclusive' means the end column is one past the last char.
    if vim.o.selection == "exclusive" then col2 = col2 - 1 end
    if #lines == 1 then
      lines[1] = string.sub(lines[1], col1, col2)
    else
      lines[#lines] = string.sub(lines[#lines], 1, col2)
      lines[1] = string.sub(lines[1], col1)
    end
  end

  local fullpath = vim.fn.expand("%:p")
  local relpath = vim.fn.expand("%:t")
  if fullpath ~= "" then
    local dir = vim.fn.expand("%:p:h")
    local root = vim.fn.systemlist({ "git", "-C", dir, "rev-parse", "--show-toplevel" })[1]
    if vim.v.shell_error == 0 and root and root ~= "" and vim.startswith(fullpath, root .. "/") then
      relpath = string.sub(fullpath, #root + 2)
    end
  end

  local range_str = (line1 == line2) and tostring(line1) or (line1 .. "-" .. line2)
  local out = "```\n" .. table.concat(lines, "\n") .. "\n```\nfrom " .. relpath .. ":" .. range_str

  vim.fn.setreg("+", out)
  vim.fn.setreg('"', out)
  vim.notify("MarkdownCopy: " .. relpath .. ":" .. range_str)
end, { range = true })
EOF

