
"Key Mapping {{

    "Basic {
        "# jk as ESC
        inoremap jk <ESC>`^
        "# ; as leader key
        let mapleader=";"
        "# clean highlight
        nnoremap <silent> <leader>ch :nohlsearch<CR>
        "# Quit without saving
        nnoremap <silent> <leader>qq :q!<CR>
        "# Save file
        nnoremap <silent> <leader>ss :w<CR>
        "# Remove trailing space
        nnoremap <silent> <leader>rt :call StripTrailingWhitespace()<CR>

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

    "FlyGrep {
        "install ack
        nnoremap <leader>fg :FlyGrep<CR>
    "}
    
    "Vim-easy-align {
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    "}
    
    "Fugitive {
        nmap <silent> <leader>gs :Gstatus<CR>
        nmap <silent> <leader>gb :Gblame<CR>
        nmap <silent> <leader>gr :Gread<CR>
        nmap <silent> <leader>gw :Gwrite<CR>
        nmap <silent> <leader>gd :Gdiff<CR>
    "}
"}}

"Plugins {{
    call plug#begin('~/.vim/plugged')
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'wsdjeg/FlyGrep.vim', { 'on': 'FlyGrep' }
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips' 
    Plug 'itchyny/lightline.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/LeaderF'
    Plug 'junegunn/vim-easy-align'
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
    Plug 'Yggdroot/indentLine'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
    Plug 'zchee/deoplete-jedi', {'for': 'python'}
    Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
    call plug#end()
"}}

"Plugin Config {{

    "Vim-sneak {
        let g:sneak#label = 1
    "}
    
    "Lightline {
        let g:lightline = {
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#head'
          \ },
          \ }
    "}

    "ALE {
        " pip3 install flake8 yapf
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
        let g:NERDTreeWinPos = "left"
        let NERDTreeAutoDeleteBuffer = 1
        let NERDTreeMinimalUI = 1
        let NERDTreeDirArrows = 1
    "}

    "LeaderF {
        let g:Lf_WindowHeight = 0.35
    "}

    "Gutentags {
        " install universal-ctags
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
        let g:indentLine_color_gui = '#6c6d6b'
        let g:indentLine_color_tty_light = 7 " (default: 4)
        let g:indentLine_color_dark = 1 " (default: 2)"
        let g:indentLine_char = '|'
    "}

    "Deoplete {
        let g:deoplete#enable_at_startup = 1
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

        "#deoplete-go Platform
        let g:deoplete#sources#go#gocode_binary = '/home/lochuan/Goland/bin/gocode'
        let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

        "#deoplete-rust Platform
        let g:deoplete#sources#rust#racer_binary='/home/lochuan/.cargo/bin/racer'
        let g:deoplete#sources#rust#rust_source_path='/home/lochuan/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
    "}

"}}

"Basic Config{{
    colorscheme gruvbox
    filetype on
    filetype plugin indent on
    autocmd FileType markdown let g:indentLine_enabled=0
    set diffopt+=vertical
    set termguicolors
    set autoindent
    set autoread
    set background=dark
    set backspace=indent,eol,start
    set complete-=i
    set cursorcolumn
    set cursorline
    set display+=lastline
    set encoding=utf8
    set expandtab
    set formatoptions+=j
    set gcr=a:block-blinkon0
    set hlsearch
    set incsearch
    set laststatus=2
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    set nobackup
    set nocompatible
    set noswapfile
    set nrformats-=octal
    set relativenumber number
    set ruler
    set scrolloff=3
    set shiftwidth=4
    set sidescrolloff=5
    set smartindent
    set smarttab
    set softtabstop=4"
    set splitright
    set splitbelow
    set showcmd             " Show (partial) command in status line.
    set showmatch           " Show matching brackets.
    set showmode            " Show current mode.
    set t_Co=256
    set tabstop=4
    set wildmenu
    set wrap
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
    syntax enable
    syntax on
"}}

"Functions {{
function StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
    endif
endfunction
"}}
