set nocompatible

" Settings
set backupdir=~/.vim/backups
set binary
if exists('+colorcolumn')
  set colorcolumn=80
endif
set directory=~/.vim/swaps
set encoding=utf-8 nobomb
set esckeys
"set cursorline
set expandtab
set gdefault
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lcs=tab:▸\ ,trail:·,eol:$,nbsp:_ " Show “invisible” characters
set list
let mapleader=","
set mouse=a
set noeol
set noerrorbells
set nostartofline
set number
set ruler
set scrolloff=3
set shiftwidth=2
set shortmess=atI
set showmode
set smartcase
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
set tabstop=2
set title
"set ttyfast
if exists("&undodir")
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000
  set undoreload=10000
endif
set wildmenu

" Functions
function Encrypted()
  setlocal noswapfile
  set viminfo=
  set foldmethod=indent
  set foldlevel=0
  set foldclose=all
  set fdo=insert
  set fdl=1
  set cms="hidden"
  set foldtext=MyFoldText()
endfunction

function MyFoldText()
  let line = v:foldend - v:foldstart
  return v:folddashes . line 
endfunction

autocmd BufReadPre * if system("head -c 9 " . expand("<afile>")) == "VimCrypt~" | call Encrypted() | endif

function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Settings toggles
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>

nmap \q :nohlsearch<CR>

nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nmap \s :set spell!<CR>

" Remaps
" Buffer Navigation
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Mash jk to escape
inoremap jk <esc>
inoremap kj <esc>

" Easy navigation in split screen
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" Arrow keys move visible line
nnoremap  <Down> gj
nnoremap  <Up> gk
vnoremap  <Down> gj
vnoremap  <Up> gk

nnoremap oo :only<cr>:next<cr>:Gdiff<cr>
nnoremap OO :only<cr>:previous<cr>:Gdiff<cr>

nmap <f2> :w<cr>:!node %<cr>
nmap <f3> :w<cr>:!coffee %<cr>
nmap <f4> :w<cr>:!npm test<cr>
nmap <f5> :w<cr>:!npm start<cr>
nmap <f6> :w<cr>:!bundle exec rspec spec<cr>
nmap <f12> :w<cr>:!git commit -a && git push<cr>

" Pathogen
call pathogen#infect()
syntax on
filetype indent on
filetype plugin indent on

