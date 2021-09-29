local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- NOTE: Reviewed plugins
    -- Packer Plugin Manager
    use 'wbthomason/packer.nvim'
    -- Surroundings management
    use 'tpope/vim-surround'
    -- Utility functions module
    use 'nvim-lua/plenary.nvim'
    -- Icons plugin
    use 'kyazdani42/nvim-web-devicons'
    -- Material theme
    use 'marko-cerovac/material.nvim'
    -- Commenting shortcuts
    use 'tpope/vim-commentary'
    -- Colorized parenthesis
    use 'p00f/nvim-ts-rainbow'
    -- Auto surrounding
    use 'jiangmiao/auto-pairs'
    -- Codestats tracking plugin
    use 'https://gitlab.com/code-stats/code-stats-vim'
    vim.g.codestats_api_key = 'SFMyNTY.YlRoa2IzUndhV1U9IyNORGt5TVE9PQ.l6MhQliSTr9ffJiCxC4kmLORtZzAScsiDp_YcWvBgrM'
    -- Auto layout switcher
    use 'lyokha/vim-xkbswitch'
    vim.g.XkbSwitchEnabled = 1
    -- Colorizer #000
    use 'norcalli/nvim-colorizer.lua'
    require'colorizer'.setup{'*';} -- Apply colorizer to all buffers
    -- Indent guides
    use 'lukas-reineke/indent-blankline.nvim'
    require'indent_blankline'.setup{
        char_highlight_list = {
            'Directory',
            'ModeMsg',
            'WarningMsg'
        }
    }
    -- Smooth Scrolling (while it is unstable in neovide)
    use 'karb94/neoscroll.nvim'
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

    -- Syntax Tree and highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    require'nvim-treesitter.configs'.setup{
        rainbow = {
            enable = true,        -- Enable the plugin
            extended_mode = true, -- Highlight tags, brackets and etc
            max_file_lines = nil, -- Ignore files with this number of line
            -- colors = {},       -- Colors configuration
        }
    }
    -- Deno JS/TS env
    use 'vim-denops/denops.vim'
    -- Git Blamer
    use 'f-person/git-blame.nvim'
    vim.g.gitblame_highlight_group='Question'
    -- TODO: Review following plugins
    -- LSP Engine
    -- use 'prabirshrestha/vim-lsp'
    -- LSP Engine
    use 'neovim/nvim-lspconfig'
    require'lspconfig'.clangd.setup{}
    require'lspconfig'.tsserver.setup{}

    -- Nice fancy finder
    use {
        'nvim-telescope/telescope.nvim',
           requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Simplify word jumping
    use 'unblevable/quick-scope'
    use {
        'shadmansaleh/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- NerdTree files manager
    use 'preservim/nerdtree'
    -- NerdTree visual operations
    use 'PhilRunninger/nerdtree-visual-selection'
    -- Registers Peekup
    use 'gennaro-tedesco/nvim-peekup'
    -- LSP Statusline
    use 'nvim-lua/lsp-status.nvim'
    -- DDN Completion
    use 'Shougo/ddc.vim'
    -- DDN Nvim LSP Client
    use 'Shougo/ddc-nvim-lsp'
    use 'Shougo/ddc-around'
    use 'Shougo/ddc-matcher_head'
    use 'Shougo/ddc-sorter_rank'
    use 'matsui54/ddc-nvim-lsp-doc'

    -- NeoVide setup
    vim.g.neovide_refresh_rate = 75
    vim.g.neovide_cursor_antialiasing = true
    -- vim.g.neovide_input_use_logo = true
    vim.g.neovide_floating_blur = 0
end)
