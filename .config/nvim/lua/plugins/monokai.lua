-- return {
--     -- Colorscheme
--     "loctvl842/monokai-pro.nvim",
--     config = function()
--         require('monokai-pro').setup({
--             transparent_background = false,
--             terminal_colors = true,
--             devicons = true
--         })
--         -- Set colorscheme
--         vim.cmd.colorscheme('monokai-pro')
--         -- Color line numbers
--         vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'magenta' })
--         vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow' })
--         vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'magenta' })
--     end
-- }
-- Lazy
return {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('monokai-nightasty').setup()
        require('monokai-nightasty').load()
        vim.cmd.colorscheme('monokai-nightasty')
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'magenta' })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow' })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'magenta' })
    end
}
