set nocompatible        " No vi compatible
syntax on               " enable syntax processing

" Vim-Plug
" automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Colorscheme
" syntax support
Plug 'dense-analysis/ale'
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'                " YAML support
"Plug 'ycm-core/YouCompleteMe' later

" productivity
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Cleanup?
Plug 'vim-airline/vim-airline'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'rhysd/committia.vim'

" Colorscheme
Plug 'NLKNguyen/papercolor-theme'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" Colorscheme
if has('gui_running')
    colorscheme gruvbox
    set background=light
elseif &t_Co < 256
    colorscheme default
else
    set termguicolors
    set background=dark
    set t_Co=256
    colorscheme gruvbox
endif


" UI Config
set number              " line numbering
set relativenumber      " show relative numbering
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=12        " Keep cursor in approximately the middle of the screen
set updatetime=100      " Some plugins require fast updatetime
set ttyfast             " Improve redrawing

" Spaces & Tabs
"https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
"https://vim.fandom.com/wiki/Highlight_unwanted_spaces
set list
set listchars=tab:␉·
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Indentation
set autoindent
set smartindent
set cindent

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>


" Misc.
" See http://vimregex.com/ for regex
"highlight HardTab cterm=underline
"set lcs=tab:├─
"autocmd BufWinEnter * 2 match HardTab /\t\+/
" Keep 80 columns and dense lines.
set colorcolumn=88
highlight ColorColumn ctermbg=0 guibg=lightgrey
set fileformat=unix     " only LF
set backspace=2         " Make backspace works like most other applications.
set modeline            " Detect modeline hints.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"These languages have their own tab/indent settings.
"au FileType c          setl ts=4 sw=4 sts=4
"au FileType cpp        setl ts=2 sw=2 sts=2
"au FileType javascript setl ts=2 sw=2 sts=2
"au FileType yaml       setl ts=4 sw=4 sts=4
"au Filetype rst        setl ts=3 sw=3 sts=3
"au FileType make       setl ts=4 sw=4 sts=4 noet

"Some additional syntax highlighters.
"au! BufRead,BufNewFile *.wsgi setfiletype python
"au! BufRead,BufNewFile *.sass setfiletype sass
"au! BufRead,BufNewFile *.haml setfiletype haml
"au! BufRead,BufNewFile *.less setfiletype less
"au! BufRead,BufNewFile *rc setfiletype conf

" Plugin: FZF
nnoremap <leader>f :FZF<CR>
nnoremap <leader>/ :Lines<CR>

" Useful vimrc link
" https://github.com/anishathalye/dotfiles/blob/master/vimrc
" https://github.com/JJGO/dotfiles/blob/master/vim/.vimrc
