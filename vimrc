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
inoremap jk <ESC>`^
let mapleader=";"
let g:sneak#label = 1

"##### Plugs #####
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/LeaderF'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'

"#ALE
"-------------------------------------
Plug 'w0rp/ale'
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_linters = {'python': ['mypy', 'flake8'], 'go': ['gometalinter']}
let g:ale_fixers = {'python': ['yapf']}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_go_gometalinter_options = '--vendored-linters --disable-all --enable=gotype --enable=vet --enable=golint -t'
let g:ale_open_list = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options='--ignore E501'

nmap <silent> <leader>nn <Plug>(ale_next_wrap)
nmap <silent> <leader>xx :ALEFix<CR>
"-------------------------------------

"#Ack
"-------------------------------------
Plug 'mileszs/ack.vim'
nnoremap <leader>ss :Ack 
"-------------------------------------

"# Completor
"-------------------------------------
Plug 'maralla/completor.vim'
let g:completor_python_binary = '/usr/local/bin/python3'
let g:completor_node_binary = '/usr/local/bin/node'
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_gocode_binary = '/Users/tron/.go/bin/gocode'
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
"Toggle with <Leader> + i
"-------------------------------------

"#Anyfold
"-------------------------------------
Plug 'pseewald/vim-anyfold'
let anyfold_activate=1
set foldlevel=10
" za -> close fold
"-------------------------------------


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
