local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Surrounding management
    use 'tpope/vim-surround'
    -- LSP Engine
    use 'prabirshrestha/vim-lsp'
    -- LSP Engine
    use 'neovim/nvim-lsp'
    -- Deoplete suggestions
    use 'Shougo/deoplete.nvim'
    use 'lighttiger2505/deoplete-vim-lsp'
    -- Functions I don't want to write twice
    use 'nvim-lua/plenary.nvim'
    -- Some fancy icons
    use 'kyazdani42/nvim-web-devicons'
    -- Nice fancy finder
    use {
        'nvim-telescope/telescope.nvim',
           requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Material theme
    use 'marko-cerovac/material.nvim'
    -- Commenting shortcuts
    use 'tpope/vim-commentary'
    -- Colorized parenthesis
    use 'p00f/nvim-ts-rainbow'
    -- Simplify word jumping
    use 'unblevable/quick-scope'
    -- Auto surrounding
    use 'jiangmiao/auto-pairs'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- Codestats tracking plugin
    use 'https://gitlab.com/code-stats/code-stats-vim'
    -- Auto layout switcher
    use 'lyokha/vim-xkbswitch'
    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'
    -- Indent guides
    use 'lukas-reineke/indent-blankline.nvim'
    -- Smooth Scrolling (while it is unstable in neovide)
    use 'karb94/neoscroll.nvim'
    -- Syntax Tree and highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- NeoVim dashboard
    use 'glepnir/dashboard-nvim'
    -- NerdTree files manager
    use 'preservim/nerdtree'
    -- NerdTree visual operations
    use 'PhilRunninger/nerdtree-visual-selection'
    -- Git Blamer
    use 'APZelos/blamer.nvim'
end)
