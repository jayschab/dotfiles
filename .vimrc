" Use pathogen manager
execute pathogen#infect()

colorscheme railscasts

" Necesary for lots of cool vim things
set nocompatible

" Create backups
set backup
set backupdir=~/.vim/backup

" Set lines to show at bottom before scrolling
set scrolloff=5

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
filetype plugin indent on
syntax enable
syntax on

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set incsearch     " Highlight the incremental search
set hlsearch      " Highlight the matches of search

" Show trailing whitespace with ....'s
set list listchars=trail:·

" highlight current line
set cursorline

" Turn tabs into spaces
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" Always display the status line
set laststatus=2

" Make backspace act like you would expect
set backspace=2

" This shows what you are typing as a command.
"set showcmd

" Enable mouse support in console
set mouse=a

" Line numbering
"  now handled by vim-numbertoggle

" Jump to last cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Remove trailing whitespace on write
au FileType ruby,javascript,eruby,yaml autocmd BufWritePre <buffer> :%s/\s\+$//e

" Completion
set completeopt=longest,menuone

" Ruby Comments
vnoremap <leader># <c-v>I#~ <ESC>

" Custom Plugins
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

let g:ruby_doc_command='open'

let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    ""
" CUSTOM OPTIONS FOR SPECIFIC FILETYPES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    ""
autocmd BufRead,BufNewFile *.ejs set filetype=eruby

autocmd FileType yaml,markdown setlocal spell
autocmd BufRead,BufNewFile */config/locales/*.yml call SetI18nFileSpellLang()

function! SetI18nFileSpellLang()
  let l:filelocale = matchlist(expand("%"), '\v(\l{2}(-\u{2})?)\.yml')[1]
  let l:vimlocale = join(split(tolower(filelocale), "-"), "_")
  let &spelllang=l:vimlocale
 endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    ""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    ""
"map <leader>y "*y
"map <leader>p "*p
map <leader>n :NERDTree<cr>

