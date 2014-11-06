nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
set pastetoggle=

"Movement
nmap j gj
nmap k gk

"NERDTree
nmap \e :NERDTreeToggle<CR>

"Searching
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

"Pathogen
execute pathogen#infect()

"Theme/Color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	  set t_Co=256
endif
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


