"        _
"__    _(_)_  __ __  _ __ ___
"\ \  / / | '_  `_ \| '__/ __|
" \ \/ /| | | | | | | | | (__
"  \__/ |_|_| |_| |_|_|  \___|

" Basic Settings
"
set nocompatible
filetype off 
syntax enable																		"syntax highlighting"
set showmatch																		"bracket highlighting"
set noerrorbells																	"no error bells sounding"
set wrap																			"does not wrap text into the next line"
set encoding=utf-8																	"encoding"
setlocal cm=blowfish2																"encryption"

" PUGINS
set rtp+=~/.vim/bundle/Vundle.vim                                               
if filereadable(expand("~/.vim_plugin"))
    source ~/.vim_plugin
endif
filetype plugin on

" colorscheme
colorscheme gruvbox
" indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab																		"converts tabs into spaces"
set smartindent
" Numbering
set relativenumber																	"easier orientation"
set number																			"shows the current linenumber you are in"
set colorcolumn=80                                                                  "shows only 80 columns"
set signcolumn=yes                                                                  "displays a signcolumn --very useful for debugging"
" search
set nohlsearch
set incsearch 
" buffer
set hidden																			"keeps your buffer in the background"
" case_sensitivity
set ignorecase																		"necessary for smartcase"
set smartcase																		"recognizes Case sensitivty"
" logging_history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" scrolling
set scrolloff=8
" command_line_auto_completion
set wildmenu
set wildmode=list:longest,full
" status_bar
set laststatus=2

" ORG_mode
:packloadall
:silent! helptags ALL

" Remapping
let mapleader = " "																	"leader_key"
nnoremap <F5> :UndotreeToggle<CR>													"open undotree"
nnoremap <leader>pv :wincmd v<bar> :Ex <Bar> :vertical resize 30<CR>				"resizes the window to 30"
nnoremap <silent> <leader>+ :vertical resize +5<CR>									"add size 5"
nnoremap <silent> <leader>- :vertical resize -5<CR>									"reduce size 5"
nnoremap <C-t> :NERDTreeToggle<CR>                                                  "toggle NERDTree"
nnoremap <C-x> :w !python<CR>                                                       "execute python"
