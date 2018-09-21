" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/zsh
        endif
    " }
    
    " 打开自动定位到最后编辑位置 {
        if has("autocmd")
            au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        endif
    " }

" }

" Vundle {
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    " vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'joshdick/onedark.vim'
    Plugin 'python-mode/python-mode'
    Plugin 'Lokaltog/vim-powerline'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/nerdtree'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'scrooloose/nerdcommenter'

    " 插件列表结束
    call vundle#end()
    filetype plugin indent on

    " vim-powerline {
        let g:Powerline_stl_path_style = 'full'
        let g:Powerline_colorscheme='solarized256'
    " }

    " vim-indent-guides {
        " 随 vim 自启动
        let g:indent_guides_enable_on_vim_startup=1
        " 从第二层开始可视化显示缩进
        let g:indent_guides_start_level=1
        " 色块宽度
        let g:indent_guides_guide_size=1
        " 快捷键 i 开/关缩进可视化
        nmap <silent> <Leader>i <Plug>IndentGuidesToggle
    " }

    " NeoComplete {
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
    " }

    " NERD Commenter {
        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1

        " Use compact syntax for prettified multi-line comments
        let g:NERDCompactSexyComs = 1

        " Align line-wise comment delimiters flush left instead of following code indentation
        let g:NERDDefaultAlign = 'left'

        " Set a language to use its alternate delimiters by default
        let g:NERDAltDelims_java = 1

        " Add your own custom formats or override the defaults
        let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

        " Allow commenting and inverting empty lines (useful when commenting a region)
        let g:NERDCommentEmptyLines = 1

        " Enable trimming of trailing whitespace when uncommenting
        let g:NERDTrimTrailingWhitespace = 1

        " Enable NERDCommenterToggle to check all selected lines is commented or not 
        let g:NERDToggleCheckAllLines = 1
    " }
" }

" General {
    set background=dark         " Assume a dark background

    filetype on                 " 开启文件类型侦测 
    "filetype indent on          " 根据文件类型采用不同缩进
    filetype plugin on          " 根据侦测到的不同类型加载对应的插件
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif


    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
" }

" Vim UI {

    colorscheme solarized             " Load a colorscheme

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    set ruler                   " Show the ruler
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
    set laststatus=2

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set relativenumber              " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set wildmenu                    " Show list instead of just completing
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set foldenable                  " Auto fold code
    set foldmethod=indent

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

" }

" FileEncode Settings {
    set encoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    set helplang=cn
    set langmenu=zh_CN.UTF-8
    set termencoding=utf-8
" }

" Key (re)Mappings {
    let mapleader = ';'
    vnoremap <Leader>y "+y 
    nmap <Leader>p "+p

    noremap LB ^
    noremap LE $

    map <space> /

    " 命令行模式 <C-b> 移动至行首 <C-e> 移动至行尾
    cnoremap <C-b> <Home>
    cnoremap <C-e> <End>

    " 去掉搜索高亮
    noremap <silent> <Leader>/ :nohls<CR>

" }

