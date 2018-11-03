"Plugins {{
    call plug#begin('~/.vim/plugged')
        Plug 'morhetz/gruvbox'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'wsdjeg/FlyGrep.vim'
        Plug 'sheerun/vim-polyglot'
        Plug 'jiangmiao/auto-pairs'
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips' 
        Plug 'itchyny/lightline.vim'
        Plug 'justinmk/vim-sneak'
        Plug 'scrooloose/nerdcommenter'
        Plug 'Yggdroot/LeaderF'
        Plug 'junegunn/vim-easy-align'
        Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
        Plug 'w0rp/ale'
        Plug 'scrooloose/nerdtree'
        Plug 'Yggdroot/indentLine'
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-go', { 'do': 'make'}
    call plug#end()
"}}

"Plugin Config {{

    "Vim-sneak {
        let g:sneak#label = 1
    "}

    "ALE {
        let g:ale_warn_about_trailing_whitespace = 0
        let g:ale_linters = {'python': ['flake8'], 'go': ['gometalinter']}
        let g:ale_fixers = {'python': ['yapf'], 'go': ['gofmt', 'goimports']}

        let g:ale_linters_explicit = 1

        let g:ale_lint_on_text_changed = 'never'
        let g:ale_lint_on_enter = 1
        let g:ale_lint_on_save = 1

        let g:ale_sign_column_always = 1
        let g:ale_set_loclist = 1

        let g:ale_go_gometalinter_options = '--vendored-linters --disable-all --enable=gotype --enable=vet --enable=golint -t'
        let g:ale_sign_error = '✗'
        let g:ale_sign_warning = '⚠'
        let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

        let g:ale_echo_msg_error_str = 'E'
        let g:ale_echo_msg_warning_str = 'W'
        let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
        let g:ale_python_flake8_options='--ignore E501'
    "}

    "Nerdtree {
        let g:NERDTreeWinPos = "right"
    "}

    "LeaderF {
        let g:Lf_WindowHeight = 0.35
    "}

    "Gutentags {
        " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
        let g:gutentags_project_root = ['.git']

        " 所生成的数据文件的名称
        let g:gutentags_ctags_tagfile = '.tags'

        " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
        let s:vim_tags = expand('~/.cache/tags')
        let g:gutentags_cache_dir = s:vim_tags
    "}

    "Indentline {
        let g:indentLine_color_term = 239
        let g:indentLine_color_gui = '#A4E57E'
        let g:indentLine_color_tty_light = 7 " (default: 4)
        let g:indentLine_color_dark = 1 " (default: 2)"
        let g:indentLine_char = '|'
    "}

    "Codi {
         let g:codi#interpreters = {
       \ 'python': {
           \ 'bin': 'python3',
           \ 'prompt': '^\(>>>\|\.\.\.\) ',
           \ },
       \ }

    "}
    
    "Deoplete {
        let g:deoplete#enable_at_startup = 1
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

        "#deoplete-go Platform
        let g:deoplete#sources#go#gocode_binary = '/Users/tron/Goland/bin/gocode'
        let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    "}

"}}

"Basic Config{{
    colorscheme gruvbox
    filetype on
    filetype plugin indent on
    syntax enable
    syntax on
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
    set autoread
    set complete-=i
    set nrformats-=octal
    set incsearch
    set cursorline
    set sidescrolloff=5
    set display+=lastline
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    set formatoptions+=j
    set cursorcolumn
    set laststatus=2
    set encoding=utf8
    set ruler
    set splitright
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
    set nocompatible
    set backspace=indent,eol,start
"}}

"Key Mapping {{

    "Basic {
        "# jk as ESC
        inoremap jk <ESC>`^
        "# ; as leader key
        let mapleader=";"
        "# <Ctrl>_L as clean screen
        nnoremap <silent> <leader>ch :nohlsearch<CR>
        "# Quit without saving
        nnoremap <silent> <leader>qq :q!<CR>
        "# Save file
        nnoremap <silent> <leader>sv :w<CR>

        "# Window Split Moving
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>
    "}

    "ALE {
        nmap <silent> <leader>aj <Plug>(ale_next_wrap)
        nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
        nmap <silent> <leader>ax <Plug>(ale_fix)
    "}

    "LeaderF {
        let g:Lf_ShortcutF = '<leader>ff'
        let g:Lf_ShortcutB = '<leader>fb'
        nmap <silent> <leader>fn :LeaderfFunction<CR>
    "}

    "Nerdtree {
        nnoremap <leader>e :NERDTreeToggle<CR>
    "}

    "Nerdtree {
        nnoremap <leader>fg :FlyGrep<CR>
    "}
    
    "Vim-easy-align {
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    "}
"}}


