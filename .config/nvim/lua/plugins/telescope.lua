return {
    {
        -- Lists fuzzy finder
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Telescope - Find files",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Telescope - Live grep",
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Telescope - Buffers",
            },
            {
                "<leader>fn",
                function()
                    require("telescope").extensions.notify.notify()
                end,
                desc = "Telescope - Notifications",
            },
            {
                "<leader>fy",
                function()
                    require('telescope').extensions.neoclip.default()
                end
            }
        }
    },
    {
        -- UI Prompts forward to telescope
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {}
                    }
                }
            })
            require('telescope').load_extension('ui-select')
        end
    },
}
