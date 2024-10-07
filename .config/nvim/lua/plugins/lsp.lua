return {
    {
        -- Completion Engine
        "hrsh7th/nvim-cmp",
        lazy = false,
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' }
                }, {
                    { name = 'buffer' },
                })
            })
        end
    },
    {
        -- Sync LSP and CMP
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        -- Sync snippets and CMP
        "saadparwaiz1/cmp_luasnip"
    },
    {
        -- Snippets Factory
        "L3MON4D3/LuaSnip",
    },
    {
        -- Some snippets presets
        "rafamadriz/friendly-snippets"
    },
    {
        -- Linting and Formatting engine
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = { null_ls.builtins.formatting.clang_format },
            })
            local python_formatter = {
                method = null_ls.methods.FORMATTING,
                filetypes = { "py" },
                generator = null_ls.formatter({
                    command = "ruff",
                    args = { '$FILENAME' },
                }),
            }
            null_ls.register(python_formatter)
        end
    },
    {
        -- Treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "python", "markdown"},
                sync_install = false,
                highlight = { enable = true },
            })
        end
    },
    {
        -- Package manager (LSP, etc)
        "williamboman/mason.nvim",
        config = true,
    },
    {
        -- Close gap between mason and config
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                'lua_ls',
                'basedpyright',
                'pylsp',
            }
        },
        lazy = false
    },
    {
        -- LSP Configuration
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })
            lspconfig.texlab.setup({
                capabilities = capabilities,
            })
        end,
        keys = {
            {
                '<Leader>h',
                function()
                    vim.lsp.buf.hover()
                end,
                mode = 'n',
                desc = 'Show hover information'
            },
            {
                '<Leader>ca',
                function()
                    vim.lsp.buf.code_action()
                end,
                mode = { 'n', 'v' },
                desc = 'Show code actions'
            }
        }
    },
}
