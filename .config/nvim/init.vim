" Author: m8.pie
" Website: m8dotpie.co.uk

filetype plugin indent on " Enable filetype dependent features

" Basic configuration
set colorcolumn=90        " Char limit marker at 91th column
set textwidth=90          " Line breaks at char limit
set hidden                " Allow buffer switching without saving
set autoread              " Autoupdate changed files
set ignorecase            " Case insensitive searching
set smartcase             " Case-sensitive but smart
set shell=/bin/zsh\ -i    " Terminal environment is zsh now
set incsearch             " Incremental search
set mouse=a               " Mouse enabled
set magic                 " Enable regex magic

" Appearance configuration
syntax on                 " Enable syntax highlighting
set number relativenumber " Enable smart relative line numbers
set wrap                  " Wrap long lines on screen
set linebreak             " Wrap long lines only by whole words
set showtabline=2         " Always enable tabline
set hlsearch              " Search highlighting
set noerrorbells          " No error bells
set visualbell            " Make bell behave as screen flash
set autoindent            " Autoindent new lines
set laststatus=1          " Status line enabled for multiple windows
set scrolloff=5           " Number of lines above and below the cursor
set title                 " Change terminal title
set showmatch             " Show matching braces
set matchtime=2           " 2/10 seconds to blink matching brace
set updatetime=200        " This time of inactivity updates swap file (ms)
set shortmess+=c          " Hide prompts from ins-completion-menu
