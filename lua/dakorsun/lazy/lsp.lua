return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },

        config = function()
            local cmp = require('cmp')
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            require("fidget").setup({})
            require("mason").setup()
            local ensure_installed = vim.tbl_keys({})
            vim.list_extend(ensure_installed, {
                "gopls",
                "bashls",
                "cssls",
                "eslint",
                "graphql",
                "html",
                "jsonls",
                "lua_ls",
                "tailwindcss",
                "angularls",
                "tsserver",
                "prismals",
                "rust_analyzer",
                "yamlls"
            })
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {
                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,

                    ["eslint"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.eslint.setup {
                            capabilities = capabilities,
                            filetypes = { "html", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
                                "typescript.tsx", "vue", "svelte", "astro", "yaml", "yml" },
                            on_attach = function(client, bufnr)
                                client.server_capabilities.documentFormattingProvider = true
                                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                                buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
                            end,
                            settings = {
                                codeAction = {
                                    disableRuleComment = {
                                        enable = true,
                                        location = "separateLine"
                                    },
                                    showDocumentation = {
                                        enable = true
                                    }
                                },
                                codeActionOnSave = {
                                    enable = false,
                                    mode = "all"
                                },
                                format = true,
                                nodePath = ":pwd",
                                onIgnoredFiles = "off",
                                packageManager = "npm",
                                quiet = false,
                                rulesCustomizations = {},
                                run = "onType",
                                useESLintClass = true,
                                validate = "on",
                                workingDirectory = {
                                    mode = "location"
                                }
                            }

                        }
                    end,
                }
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })

            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },
}
