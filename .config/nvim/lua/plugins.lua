local execute = vim.api.nvim_command
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
    use 'm8dotpie/material.vim'
    -- Commenting shortcuts
    use 'tpope/vim-commentary'
    -- Colorized parenthesis
    use 'frazrepo/vim-rainbow'
    -- Simplify word jumping
    use 'unblevable/quick-scope'
end)
