
" ============================================================
" " pluginsList
" " ============================================================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired' " check the docs is powerful
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'for': [ 'go', 'tf', 'json', 'yaml', 'sh'] , 'do': 'yarn install --frozen-lockfile'}
call plug#end()

" ============================================================
" basicSetting
" ============================================================
let mapleader = ' '
let maplocalleader = ' '
set rnu
set nu
set list
set autoread
nnoremap <C-n> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
set clipboard=unnamed

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

" netrw
let g:netrw_banner = 0
let g:netrw_localrmdir='rm -r'

" vimdiff
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>do :windo diffoff<CR>
nnoremap <leader>du :windo diffupdate<CR>

" ============================================================
" UI
" ============================================================

" theme
set t_ut=
set t_Co=256
let g:airline_theme='gruvbox'
let g:codedark_conservative = 1
colorscheme gruvbox


" ============================================================
" langConfigs
" ============================================================

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" bash
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab

" terraform
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType tf nnoremap <F3> :!terraform fmt %<CR>

" json
autocmd FileType json syntax match Comment +\/\/.\+$+

" ============================================================
" FZF
" ============================================================
map <C-p> :Files<CR>
map <C-f> :Rg<CR>
nnoremap <leader><leader> :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" ============================================================
" COC
" ============================================================

" if hidden is not set, TextEdit might fail.
set hidden
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort


  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>co :<C-u>CocList outline<cr>
" Remap for format selected region
nmap <leader>cf  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>

" ============================================================
" FUGITIVE
" ============================================================
nmap <silent> <leader>ga :w<CR>:G add %<CR>
nmap <silent> <leader>gc :w<CR>:Gcommit<CR>
