" Show line numbers
set number

" Visible vertical line at 80 characters (MAD ugly. Need to update)
set colorcolumn=80

" Show command in bottom bar
set showcmd

" Highlight current line
set cursorline

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable

" Only dapper AF colorschemes for me
colorscheme evening

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
