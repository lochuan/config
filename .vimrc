colorscheme gruvbox
set laststatus=2
set encoding=utf8
set ruler
set hlsearch
set scrolloff=3
set nobackup
set noswapfile
set relativenumber number
set wildmenu
set background=dark
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set wrap
set expandtab
set smarttab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4"
set t_Co=256
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype on                  " required
filetype indent on
syntax enable
syntax on
inoremap jk <ESC> 
let mapleader=","
let g:sneak#label = 1

" ------ START change the status line ------
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=[%F]
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  "highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset"
" ------ END change the status line------


" ------ Vundle ------
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" --------------------

Plugin 'VundleVim/Vundle.vim'


Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"


Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)"
let g:indentLine_char = '|'
nnoremap <leader>i :IndentLinesToggle <cr>

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-surround'
" cs"' change surround from " to '
" ds" delete surround "
" ysiw add surround

Plugin 'justinmk/vim-sneak'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'L9'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pseewald/vim-anyfold'
let anyfold_activate=1
set foldlevel=10

Plugin 'godlygeek/tabular'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ------ START syntastic setting------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" ------ END syntastic setting------

" ------ Window switch remapping -----
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
