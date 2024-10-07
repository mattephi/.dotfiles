return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            {
                '<leader>n',
                '<cmd>Neotree toggle<CR>',
                desc = 'Toggle Neotree on the left',
            },
        },
        config = function()
            require('neo-tree').setup({
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                    }
                }
            })
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').create_default_mappings()
            require('leap').opts.safe_labels = {}
        end
    },
    {
        -- Clipboard history
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            -- you'll need at least one of these
            { 'nvim-telescope/telescope.nvim' },
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup({})
        end,
    },
    {
        -- Register peeking
        "tversteeg/registers.nvim",
        cmd = "Registers",
        config = true,
        keys = {
            { "\"",    mode = { "n", "v" } },
            { "<C-R>", mode = "i" }
        },
        name = "registers",
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        -- Devicons
        "nvim-tree/nvim-web-devicons"
    },
    {
        -- Smooth scrolling
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup {}
        end
    },
    {
        -- Some lua functions
        "nvim-lua/plenary.nvim"
    },
    {
        -- Notification engine
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
            require('notify').setup({
                background_colour = "#000000",
                stages = "fade",
                timeout = 5000,
            })
            require("telescope").load_extension("notify")
        end,
    },
    {
        'nacro90/numb.nvim',
        config = function()
            require('numb').setup {
                show_numbers = true,         -- Enable 'number' for the window while peeking
                show_cursorline = true,      -- Enable 'cursorline' for the window while peeking
                hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
                number_only = false,         -- Peek only when the command is only a number instead of when it starts with a number
                centered_peeking = true,     -- Peeked line will be centered relative to window
            }
        end
    },
    {
        -- Commenting engine
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        lazy = false,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require('rainbow-delimiters.setup').setup()
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
}
