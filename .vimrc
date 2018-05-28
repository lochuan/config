"======================Shortcuts===========================================
" :e -> filename   编辑文件
" :tabe -> 在Tab中编辑文件
" :gt -> Go next tab 
" :gT -> Go prev tab 
" Ctrl + r -> Redo
" u -> Undo 
" :r !command -> 把命令输出粘帖到编辑区 
" Ctrl + n -> Next pop up completion
" Ctrl + p -> Prev pop up completion
" :w !sudo tee % 存储Read-Only文件
"==========================================================================

colorscheme gruvbox
set cursorline
set colorcolumn=80
set cursorcolumn
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

"##### Plugs #####
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips' 

"#Airlinetheme
"-------------------------------------
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='angr'
"-------------------------------------
"
"#Markdown
"-------------------------------------
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0
"-------------------------------------

"#Nerdtree
"-------------------------------------
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
"Toggle with Ctrl + n
"-------------------------------------

"#Indentline
"-------------------------------------
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)"
let g:indentLine_char = '|'
nnoremap <leader>i :IndentLinesToggle <cr>
"Toggle with , + i
"-------------------------------------

"#Surround
"-------------------------------------
Plug 'tpope/vim-surround'
" cs"' change surround from " to '
" ds" delete surround "
" ysiw add surround
"-------------------------------------

"#Vim-sneak
"-------------------------------------
Plug 'justinmk/vim-sneak'
" s + two alphabets -> Fast move
" Ctrl + o -> Back to original cursor position
"-------------------------------------

"#Commenter
"-------------------------------------
Plug 'scrooloose/nerdcommenter'
" ,cc -> Comment out current line
" ,cu -> uncomment
" ,cs -> block style comment
" ,cy -> yank first and comment
"-------------------------------------

"#Anyfold
"-------------------------------------
Plug 'pseewald/vim-anyfold'
let anyfold_activate=1
set foldlevel=10
" za -> close fold
"-------------------------------------

"#Tabular
"-------------------------------------
Plug 'godlygeek/tabular'
" Tabularize /,
"-------------------------------------

"#ALE
"-------------------------------------
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"-------------------------------------

"#Completor
"-------------------------------------
Plug 'maralla/completor.vim'
let g:completor_python_binary = '/usr/bin/python3'
"-------------------------------------
"

"#DrawIt
"-------------------------------------
Plug 'vim-scripts/DrawIt'

"\di to start DrawIt and
"\ds to stop  DrawIt.
"<left>       move and draw left
"<right>      move and draw right, inserting lines/space as needed
"<up>         move and draw up, inserting lines/space as needed
"<down>       move and draw down, inserting lines/space as needed
"<s-left>     move left
"<s-right>    move right, inserting lines/space as needed
"<s-up>       move up, inserting lines/space as needed
"<s-down>     move down, inserting lines/space as needed
"<space>      toggle into and out of erase mode
">            draw -> arrow
"<            draw <- arrow
"^            draw ^  arrow
"v            draw v  arrow
"<pgdn>       replace with a \, move down and right, and insert a \
"<end>        replace with a /, move down and left,  and insert a /
"<pgup>       replace with a /, move up   and right, and insert a /
"<home>       replace with a \, move up   and left,  and insert a \
"\>           draw fat -> arrow
"\<           draw fat <- arrow
"\^           draw fat ^  arrow
"\v           draw fat v  arrow
"\a           draw arrow based on corners of visual-block
"\b           draw box using visual-block selected region
"\e           draw an ellipse inside visual-block
"\f           fill a figure with some character
"\h           create a canvas for \a \b \e \l
"\l           draw line based on corners of visual block
"\s           adds spaces to canvas
"<leftmouse>  select visual block
"<s-leftmouse>  drag and draw with current brush (register)
"\ra ... \rz  replace text with given brush/register
"\pa ...      like \ra ... \rz, except that blanks are considered
             "to be transparent
"-------------------------------------
call plug#end()

