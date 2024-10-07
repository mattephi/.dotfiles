-- Keymap
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.keymap.set('i', 'fd', '<Esc>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlight
vim.keymap.set('n', '<Leader>Fb', vim.lsp.buf.format)
