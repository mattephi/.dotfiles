" Author: m8.pie
" Website: m8dotpie.github.io/m8blog

filetype plugin on " Enable filetype plugins
filetype indent on " IDK

set colorcolumn=90 " show char limit marker
set hidden  " allow buffer switching without saving
set shell=/bin/zsh\ -i " set terminal environment to zsh
set showtabline=2 " always enable tabline
set autoread " detect when a file is changed
set history=1000 " change history to 1000
set textwidth=120
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start " make backspace behave in a sane manner
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set mouse=a " enable mouse in all modes
set magic " set magic on, for regex
set noerrorbells
set visualbell
set tm=500

" Apperance
syntax on " enable syntax highlighting
set number " enable line numbers
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set autoindent " automatically set indent of new line
set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
set laststatus=2 " show the status line all the time
set so=7 " set 7 lines to the cursors - when moving vertical
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set cmdheight=1 " command bar height
set title " set terminal title
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set updatetime=300
set signcolumn=yes
set shortmess+=c

" Tab control
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set expandtab " spaces instead of tabs
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" Code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

call plug#begin('~/.config/nvim/plugged')

" XKBSwitch
" This plugin automatically changes language to specified
" while entering normal mode.
" NOTE: This plugin requires additional library installations.
Plug 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1 " enable this plugin
let g:XkbSwitchNLayout = 'ABC' " default OSX keyboard layout

" Cosco
" This plugin places semicolumn at the end of the line on specified key.
Plug 'https://github.com/lfilho/cosco.vim'
nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)

" Rainbow
" This highlights colors brackets and etc with different colors
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Quickscope
" This plugin highlights unique symbols to help in motions
" with fF or tT
Plug 'unblevable/quick-scope'

" Automatic Relative Line Numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Auto-Pairs
Plug 'jiangmiao/auto-pairs'

" Git plugin
Plug 'tpope/vim-fugitive'

" Repeat plugin for plugins
Plug 'tpope/vim-repeat'

" Commentary
" Plugin for simple commenting
Plug 'tpope/vim-commentary'

" System-Copy
" Simple tool for copying and pasting on cp cv
Plug 'christoomey/vim-system-copy'

" Lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {
        \ 'colorscheme': 'landscape', 
        \ }
let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste', ],
        \		  [ 'readonly', 'modified' ],
        \     ['codestats']],
        \ 'right':  [ [ 'lineinfo' ], 
        \		    [ 'percent' ], 
        \		    [ 'currenttime' ] ]
        \}
let g:lightline.inactive = {
        \ 'left': [],
        \ 'right': [],
        \}
let g:lightline.component_function = {
        \	'bufferinfo': 'lightline#buffer#bufferinfo',
        \ }
let g:lightline.component_expand = {
        \	'buffercurrent': 'lightline#buffer#buffercurrent',
        \	'bufferbefore': 'lightline#buffer#bufferbefore',
        \	'bufferafter': 'lightline#buffer#bufferafter',
        \ }
let g:lightline.component_type = {
        \	'buffercurrent': 'tabsel',
        \	'bufferbefore': 'raw',
        \	'bufferafter': 'raw',
        \ }
let g:lightline.component = {
        \ 	'codestats': '%{CodeStatsXp()}',
        \ 	'currenttime': '%{strftime("%H:%M:%S")}'
        \}
let g:lightline.tabline = {
        \ 'left':  [ [ 'bufferinfo' ],
        \             [ 'separator' ],
        \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
        \ 'right': [],
        \ }

" Lightline Bufferline
Plug 'taohexxx/lightline-buffer'
let g:lightline_buffer_enable_devicons = 1
let g:lightline_buffer_fname_mod = ':t' " show file extensions
let g:lightline_buffer_maxfextlen = 4 " enable file extensions with len of 4

" Devicons
" Adds cool glyphs to plugins
Plug 'ryanoasis/vim-devicons'
set encoding=utf8
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" Landscape theme
Plug 'itchyny/landscape.vim'
let g:landscape_highlight_todo = 1 " enable TODO highlighting

" CtrlP
" Amazing fuzzy file/buffer/etc finder
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>' " command to call CtrlP
let g:ctrlp_cmd = 'CtrlP' " another command to enable map
no <C-[> :CtrlPBuffer<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " ignore this files with wildignore

" Smooth-Scroll
" Plugin for smooth and comfortable scrolling
Plug 'terryma/vim-smooth-scroll'
no <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR> 
no <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR> 
no <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR> 
no <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR> 

" Vim surround
" Plugin for fast and easy surroundings
Plug 'tpope/vim-surround'

" ALE
" Plugin for code analysis and error displays
Plug 'w0rp/ale'
let g:ale_linters = {'c': ['clang'], 'cpp': ['clang', 'g++']}
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++2a'
let g:ale_cpp_clang_options = '-Wall -O2 -std=c++2a'

" Vimtex
" Plugin for vim TEX integration
Plug 'lervag/vimtex'
set conceallevel=1
let g:tex_conceal='abdmg'
let g:tex_flavor = 'latex'

" Q# Language support
Plug 'gootorov/q-sharp.vim'

" Codestats
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
let g:codestats_api_key = 'SFMyNTY.YlRoa2IzUndhV1U9IyNORGt5TVE9PQ.l6MhQliSTr9ffJiCxC4kmLORtZzAScsiDp_YcWvBgrM'

call plug#end()

" NOTE: enabling colorscheme must procede after all plugins load.
colorscheme landscape " set current colorscheme to my favourite

" Amazing shortcut which I would recommend for everyone
inoremap fd <Esc>
" It is russian letter "o"
inoremap ав <Esc>

" move to next buffer
nmap <silent><leader>l :bnext<CR> 
" move to previous buffer
nmap <silent><leader>h :bprevious<CR> 
" close current buffer and move to previous
nmap <silent><leader>bq :bp <BAR> bd #<CR> 

" in order to stop using arrows - I made them useless.
no <Up> <nop> 
no <Down> <nop> 
no <Left> <nop> 
no <Right> <nop> 

"switching to below window 
no <C-j> <C-w>j| 
"switching to above window
no <C-k> <C-w>k| 
"switching to right window 
no <C-l> <C-w>l| 
"switching to left window
no <C-h> <C-w>h| 

highlight QuickScopePrimary guifg='#ffff00' gui=underline ctermfg=226 cterm=underline
highlight QuickScopeSecondary guifg='#ff5f00' gui=underline ctermfg=202 cterm=underline

