" No compatible with vi
set nocompatible
"Plug
filetype off
call plug#begin('~/.vim/plugged')
"theme
Plug 'NLKNguyen/papercolor-theme'
"syntax support
Plug 'plasticboy/vim-markdown'
Plug 'vivien/vim-linux-coding-style'
"productivity
Plug 'w0rp/ale'
"Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'rhysd/committia.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
" vim latex
Plug 'lervag/vimtex'
call plug#end()
filetype plugin indent on

"Syntax highlighting.
syntax on

"Line numbers on left
set number

"Set relative numbers on left
set relativenumber

"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent
set smartindent
set cindent
set hlsearch
nmap <leader><Space> :nohls<CR>
highlight HardTab cterm=underline
autocmd BufWinEnter * 2 match HardTab /\t\+/

"Use mouse.
set mouse=a

"I dislike CRLF.
set fileformat=unix

"Make backspace works like most other applications.
set backspace=2

"Detect modeline hints.
set modeline

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"These languages have their own tab/indent settings.
au FileType c          setl ts=4 sw=4 sts=4
au FileType cpp        setl ts=2 sw=2 sts=2
au FileType javascript setl ts=2 sw=2 sts=2
"au FileType ruby       setl ts=2 sw=2 sts=2
"au FileType xml        setl ts=2 sw=2 sts=2
au FileType yaml       setl ts=4 sw=4 sts=4
"au FileType html       setl ts=2 sw=2 sts=2
"au FileType htmldjango setl ts=2 sw=2 sts=2
"au FileType lua        setl ts=2 sw=2 sts=2
"au FileType haml       setl ts=2 sw=2 sts=2
"au FileType css        setl ts=2 sw=2 sts=2
"au FileType sass       setl ts=2 sw=2 sts=2
"au FileType less       setl ts=2 sw=2 sts=2
au Filetype rst        setl ts=3 sw=3 sts=3
au FileType make       setl ts=4 sw=4 sts=4 noet

"Some additional syntax highlighters.
"au! BufRead,BufNewFile *.wsgi setfiletype python
"au! BufRead,BufNewFile *.sass setfiletype sass
"au! BufRead,BufNewFile *.haml setfiletype haml
"au! BufRead,BufNewFile *.less setfiletype less
"au! BufRead,BufNewFile *rc setfiletype conf

"FZF
nmap <leader>f :FZF<CR>
nmap <leader>/ :Lines<CR>

"ctags
nmap <leader>s :ts 

"English spelling checker.
setlocal spelllang=en_us

"Keep 80 columns and dense lines.
"set colorcolumn=81
highlight ColorColumn cterm=underline ctermbg=none
autocmd BufWinEnter * match Error /\%>80v.\+\|\s\+$\|^\s*\n\+\%$/

"Theme
colorscheme PaperColor
"Theme config
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

if (has("termguicolors"))
    set termguicolors
endif

set background=dark

"Kernel Convention
let g:linuxsty_patterns = [ "/usr/src/", "/linux"]

"neovim configuration"
let g:python3_host_prog = "/usr/bin/python3"

function SetTags()
    let curdir = getcwd()

    while !filereadable("tags") && getcwd() != "/"
        cd ..
    endwhile

    if filereadable("tags")
        execute "set tags=" . getcwd() . "/tags"
    endif

    execute "cd " . curdir
endfunction
call SetTags()
"source ~/.vim/plugin/cscope_maps.vim
