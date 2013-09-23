" Ask VIM to use 256 colors:
set t_Co=256

" Ensure UTF-8
set encoding=utf-8

" Display incomplete commands:
set showcmd

" Allow switching to another buffer with unsaved changes:
set hidden

" Display line numbers:
set number

" Display cursor position:
set ruler

" Highlight search
set hlsearch

" Use 4 spaces instead of tabs:
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Indentation for javascript and html
set autoindent
filetype plugin indent on

" Set color scheme:
colorscheme zenburn

" Turn on syntax highlighting:
syntax on

" Highlight overlength lines:
highlight OverLength ctermbg=darkred
match OverLength /\%81v.\+/

" Automatically reload vimrc when it's saved
augroup AutoReloadVimRC
    au!
    au BufWritePost $MYVIMRC so $MYVIMRC
augroup END
