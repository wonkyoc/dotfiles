" Plugins (vim-plug, installs itself on first run)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'stephpy/vim-yaml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'rust-lang/rust.vim'
Plug 'rhysd/committia.vim'
Plug 'wonkyoc/vim-clean'
call plug#end()         " also turns on filetype plugin/indent and syntax

" Colorscheme
" Truecolor, also when $TERM is not an xterm variant (see :help xterm-true-color)
if has('termguicolors')
  if !has('nvim') && &term !~# '^xterm'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif
let g:clean_variant = 'paper'   " paper | linen | white, or :CleanVariant at runtime
silent! colorscheme clean

" UI
set number relativenumber
set cursorline
set colorcolumn=88
set showcmd
set wildmenu
set showmatch           " briefly jump to the matching bracket
set laststatus=2
set mouse=a
set belloff=all
set splitbelow splitright
set linebreak           " wrap long lines at word boundaries
set scrolloff=12
set updatetime=100

" Spaces & tabs
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set list listchars=tab:␉·

" Search
set incsearch hlsearch ignorecase smartcase
nnoremap <C-h> :nohlsearch<CR>
vnoremap <C-h> :nohlsearch<CR>

" Tagged comments: `TODO: ...` inside any comment gets the tint vim-clean
" defines for TagTODO; other colorschemes fall back to Todo. The match starts
" on the preceding space because syntax keywords (e.g. pythonTodo) otherwise
" win at the same column (:help syn-priority).
augroup TaggedComments
  autocmd!
  autocmd Syntax * for s:t in ['WC', 'TODO', 'FIXME', 'NOTE', 'HACK', 'BUG', 'PERF', 'Q']
        \ | execute 'syntax match Tag' . s:t . ' /\v\s?<' . s:t . ':.*$/ contained containedin=.*Comment.*'
        \ | execute 'highlight default link Tag' . s:t . ' Todo'
        \ | endfor
augroup END

" Files
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set backspace=indent,eol,start
set modeline
