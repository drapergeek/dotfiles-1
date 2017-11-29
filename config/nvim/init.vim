packadd minpac
call minpac#init()
call minpac#add('alx741/yesod.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('kien/ctrlp.vim')
call minpac#add('mxw/vim-jsx')
call minpac#add('nbouscal/vim-stylish-haskell')
call minpac#add('pangloss/vim-javascript')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('pbrisbin/vim-rename-file')
call minpac#add('pbrisbin/vim-syntax-shakespeare')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-git')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('w0rp/ale')

filetype plugin indent on

set autowrite
set colorcolumn=+1
set diffopt+=vertical
set expandtab
set grepprg=git\ grep\ -n\ $*
set linebreak
set list
set mouse=
set nojoinspaces
set nowrap
set number
set shiftwidth=2
set showbreak=\ ↪\ 
set smartindent
set textwidth=80

let mapleader = ' '
let maplocalleader = ' '
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ctrlp_user_command = [
  \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
  \ 'find %s -type f'
  \ ]
let g:ctrlp_working_path_mode = 0
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

map <Leader>T :execute '!'.b:ctags_command<CR><CR>
map <Leader>r :w \| :vs % \| :execute 'terminal '.expand('%:p')<CR>

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

tnoremap <Esc> <C-\><C-n>

augroup vimrc
  autocmd!
  autocmd BufEnter *
    \   if !exists('b:ctags_command')
    \ |   let b:ctags_command = 'ctags -R .'
    \ | endif
  autocmd BufNewFile,BufRead *.t set filetype=cram
  autocmd FileType gitcommit,hamlet,lhaskell,mail,markdown
    \   setlocal spell
    \ | setlocal nosmartindent
  autocmd FileType haskell
    \ | setlocal shiftwidth=4
    \ | let b:ctags_command = 'fast-tags **/*.hs'
  autocmd FileType qf
    \   setlocal wrap
    \ | setlocal colorcolumn=
augroup END
