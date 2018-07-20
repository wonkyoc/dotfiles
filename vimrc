set nocompatible

filetype off
call plug#begin('~/.vim/plugged')
"theme
Plug 'junegunn/seoul256.vim'
"syntax support
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'stephpy/vim-yaml'
Plug 'lepture/vim-jinja'
"Plug 'vim-ruby/vim-ruby'
"Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
"productivity
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
"Plug 'tpope/vim-rails'
Plug 'Blackrush/vim-gocode'
Plug 'rhysd/committia.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'klen/python-mode'
call plug#end()
filetype plugin indent on

"Syntax highlighting.
syntax enable

"Line numbers on left
set nu

"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent
set smartindent
set cindent
highlight HardTab cterm=underline
autocmd BufWinEnter * 2 match HardTab /\t\+/

"Use mouse.
set mouse=a

"I don't like CRLF.
set fileformat=unix

"Make backspace works like most other applications.
set backspace=2

"Detect modeline hints.
set modeline

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"These languages have their own tab/indent settings.
au FileType c          setl ts=4 sw=4 sts=4
"au FileType cpp        setl ts=2 sw=2 sts=2
au FileType javascript setl ts=2 sw=2 sts=2
au FileType ruby       setl ts=2 sw=2 sts=2
au FileType xml        setl ts=2 sw=2 sts=2
au FileType yaml       setl ts=2 sw=2 sts=2
au FileType html       setl ts=2 sw=2 sts=2
au FileType htmldjango setl ts=2 sw=2 sts=2
au FileType lua        setl ts=2 sw=2 sts=2
au FileType haml       setl ts=2 sw=2 sts=2
au FileType css        setl ts=2 sw=2 sts=2
au FileType sass       setl ts=2 sw=2 sts=2
au FileType less       setl ts=2 sw=2 sts=2
au FileType json       setl ts=2 sw=2 sts=2
au Filetype rst        setl ts=3 sw=3 sts=3
au FileType make       setl ts=4 sw=4 sts=4 noet

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less
au! BufRead,BufNewFile *rc setfiletype conf

"FZF
nmap <leader>f :FZF<CR>
nmap <leader>/ :Lines<CR>
nmap <leader>g :GFiles?<CR>

"English spelling checker.
setlocal spelllang=en_us

"Keep 80 columns and dense lines.
"set colorcolumn=81
highlight ColorColumn cterm=underline ctermbg=none
autocmd BufWinEnter * match Error /\%>80v.\+\|\s\+$\|^\s*\n\+\%$/

"Theme configuration
let g:seoul256_background = 236
colo seoul256

"neovim configuration
let g:python3_host_prog = '/usr/local/bin/python3'
