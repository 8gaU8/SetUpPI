filetype plugin indent on

set ts=4
set tabstop=4
set shiftwidth=4
set expandtab
set number
set virtualedit=block
set backspace=indent,eol,start
set wildmenu
set smartcase
set showmatch matchtime=1
set showcmd
hi Comment ctermfg=3
set clipboard=unnamed,autoselect

syntax on
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <CR> A<CR><Esc>

nnoremap <C-p> :bprevious<CR>
nnoremap <C-n> :bnext<CR>
set breakindent
set breakindentopt=shift:2,min:40,sbr
set showbreak=>>

set termguicolors 

