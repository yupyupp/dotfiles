nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
set pastetoggle=

"Movement
nmap j gj
nmap k gk

"Searching
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

"Pathogen
execute pathogen#infect()

"Theme/Color
set background=light " dark | light "                       
colorscheme solarized

"Old Config
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set nocompatible
set t_Co=16
syntax on                                                  
filetype plugin on
set cursorline
set colorcolumn=80
set spelllang=en


