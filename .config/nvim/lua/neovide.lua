-- Alacritty defaults
vim.g.neovide_text_gamma = 0.8
vim.g.neovide_text_contrast = 0.1

-- Padding settings
vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 2
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2

-- Clipboard works
vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
vim.keymap.set('v', '<D-c>', '"+y') -- Copy
vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Color settings
vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font:h14"
function AdjustFontSize(amount)
  local guifontsize = tonumber(vim.o.guifont:match(":h(%d+)"))
  guifontsize = guifontsize + amount
  local guifont = vim.o.guifont:match("^[^:]+")
  vim.o.guifont = guifont .. ":h" .. guifontsize
end
vim.api.nvim_set_keymap('n', '<C-=>', ':lua AdjustFontSize(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-->', ':lua AdjustFontSize(-1)<CR>', { noremap = true, silent = true })

vim.g.neovide_theme = 'auto'
vim.g.neovide_window_blurred = true
-- Blurs
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
-- Floating shadows
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
-- Window transparency
vim.g.neovide_transparency = 0.9

-- System settings
vim.g.neovide_remember_window_size = true
vim.g.neovide_profiler = false

