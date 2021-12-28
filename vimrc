"        _
"__    _(_)_  __ __  _ __ ___
"\ \  / / | '_  `_ \| '__/ __|
" \ \/ /| | | | | | | | | (__
"  \__/ |_|_| |_| |_|_|  \___|

" pre_settings------------------------------{{{
set nocompatible
filetype off 
syntax enable																		"syntax highlighting"
set showmatch																		"bracket highlighting"
set noerrorbells																	"no error bells sounding"
set nowrap																			"does not wrap text into the next line"
set encoding=utf-8																	"encoding"
setlocal cm=blowfish2																"encryption"
" }}}

" plugins-----------------------------------{{{
set rtp+=~/.vim/bundle/Vundle.vim                                               
if filereadable(expand("~/.vim_plugin"))
    source ~/.vim_plugin
endif
filetype plugin on
" }}}

" basic_settings----------------------------{{{
" colorscheme
colorscheme gruvbox
" indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab																        "converts tabs into spaces"
set smartindent
" Numbering
set relativenumber																	"easier orientation"
set number																			"shows the current linenumber you are in"
set cursorcolumn
set cursorline                                                                      "shows only 80 columns"
set signcolumn=yes                                                                  "displays a signcolumn -very useful for debugging"
" logging_history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" scrolling
set scrolloff=8
" command_line_auto_completion
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.gif,*.pdf,*.exe,*.flv,*.img,*.xlsx
" }}}

" search-settings----------------------------{{{
set hlsearch
set incsearch 
set hidden																			"keeps your buffer in the background"
set ignorecase																		"necessary for smartcase"
set smartcase
set showcmd                                                                         "show command in the last line"
set showmode                                                                        "show mode in the last line"
set showmatch                                                                       "show matching words"
" }}}

" mapping------------------------------------{{{
let mapleader = " "																	"leader_key"
nnoremap <F5> :UndotreeToggle<CR>													"open undotree"
nnoremap <leader>pv :wincmd v<bar> :Ex <Bar> :vertical resize 30<CR>				"resizes the window to 30"
nnoremap <silent> <leader>+ :vertical resize +5<CR>									"add size 5"
nnoremap <silent> <leader>- :vertical resize -5<CR>									"reduce size 5"
nnoremap <C-t> :NERDTreeToggle<CR>                                                  "toggle NERDTree"
nnoremap <C-x> :w !python<CR>                                                       "execute python"
" }}}

" org_mode-----------------------------------{{{

" }}}
"
" vim_scripts--------------------------------{{{
if filereadable(expand("~/.vim_function"))
    source ~/.vim_function
endif
" }}}

" status_bar---------------------------------{{{
set statusline=                                                                     "clear statusline when vim is loaded"
set statusline+=\%F\%M\%Y\%R                                                        "status_line leftside"
set statusline+=%=                                                                  "divider for the statusline"
set statusline+=ascii:\%b\hex:\0x%B\row:\%l\col:\%c\percent:\%p%%                   "status_line right side"
set laststatus=2                                                                    "show status on the second to last line"
" }}}
