" Website: m8dotpie.co.uk

filetype plugin indent on " Enable filetype dependent features

" Basic configuration
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h15
set colorcolumn=90        " Char limit marker at 90th column
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
set scrolloff=5           " Number of lines above and below the cursor
set laststatus=2          " Status line enabled for multiple windows
set showmatch             " Show matching braces
set matchtime=2           " 2/10 seconds to blink matching brace
set updatetime=200        " This time of inactivity updates swap file (ms)
set shortmess+=c          " Hide prompts from ins-completion-menu
set encoding=utf8

" Tabs configuration
set smarttab              " Respect 'tabstop' and others on tabbing
set tabstop=8             " Visible width of tabs
set softtabstop=4         " Inserted tabs length
set expandtab             " Spaces instead of tabs
set shiftwidth=4          " Indentation width
set shiftround            " Round indent to multiple of 'shiftwidth'

if (has('termguicolors'))
  set termguicolors
endif

" Plugins initialization and configuration
lua << EOF
require'plugins'
require'plugins-cfg'
require'colorizer'.setup{}
require'neoscroll'.setup{
-- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
}
EOF

" Run colorizer on start
autocmd VimEnter * ColorizerToggle

" Indentation guides colors
let g:indent_blankline_char_highlight_list = ['Directory', 'ModeMsg', 'WarningMsg']

" Autocompilation on plugins configuration change
autocmd BufWritePost plugins.lua PackerCompile

let g:deoplete#enable_at_startup = 1

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" Codestats configuration
let g:codestats_api_key='SFMyNTY.YlRoa2IzUndhV1U9IyNORGt5TVE9PQ.l6MhQliSTr9ffJiCxC4kmLORtZzAScsiDp_YcWvBgrM'

" XkbSwitch needs to be turned on
let g:XkbSwitchEnabled = 1

" Rainbow Parenthesis needs to be turned on
let g:rainbow_active = 1

" Coloscheme setting
colorscheme material

" Custom hotkeys configuration
" Spacemacs like Esc shortcuts
inoremap fd <Esc>
inoremap ав <Esc>
" Disabling arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
" Telescope hotkeys
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Neovide configuration
let neovide_remember_window_size=v:true
let g:neovide_refresh_rate=75
let g:neovide_cursor_antialiasing=v:true
let g:neovide_input_use_logo=v:true
let g:neovide_window_floating_opacity=1
let g:neovide_window_floating_blur=0
