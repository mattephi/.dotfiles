return {
    {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    keymap = {
                        accept = "<C-TAB>"
                    }
                }
            })
        end,
        keys = {
            {
                "<leader>ghc",
                function()
                    require("copilot.suggestion").toggle_auto_trigger()
                end,
                desc = "Toggle coplilot"
            }
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        opts = {},
        keys = {
            -- Show prompts actions with telescope
            {
                "<leader>ccp",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end,
                desc = "CopilotChat - Prompt actions",
            },
            -- Open floating chat
            {
                "<leader>cco",
                function()
                    local chat = require("CopilotChat")
                    chat.open({
                        window = {
                            layout = 'float',
                            title = 'Copilot Chat'
                        }
                    })
                end
            }
        }
    },
}
