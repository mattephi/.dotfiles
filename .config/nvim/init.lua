require('config')  -- Load config
require('keymap')  -- Load keymap
require('lazycfg') -- Load plugins
if vim.g.neovide then
    require('neovide')
end
