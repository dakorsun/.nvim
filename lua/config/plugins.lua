return {
    -- Themes
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme rose-pine-moon]])
            require('config.colorscheme')
        end,
    },
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPre",
        config = function()
            require("plugins.treesitter")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-textsubjects",
        },
    },

    -- Navigating (Telescope/Tree/Refactor)
    { "nvim-pack/nvim-spectre" },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = {
            "NvimTreeOpen",
            "NvimTreeClose",
            "NvimTreeToggle",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
        },
        keys = {
            { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
        },
        config = function()
            require("plugins.tree")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        config = function()
            require("plugins.telescope")
        end,
        dependencies = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "cljoly/telescope-repo.nvim" },
        },
    },
    {
        "gbprod/stay-in-place.nvim",
        lazy = true,
        config = true, -- run require("stay-in-place").setup()
    },
    {
        "ThePrimeagen/harpoon",
        lazy = false,
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.harpoon")
        end,
    },

    -- LSP Base
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "jose-elias-alvarez/nvim-lsp-ts-utils",
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = {
            { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
        },
    },

    -- LSP Cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("plugins.cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-calc",
            "saadparwaiz1/cmp_luasnip",
            {
                "David-Kunz/cmp-npm",
                config = function()
                    require("plugins.cmp-npm")
                end,
            },
        },
    },

    -- LSP Addons
    { "onsails/lspkind-nvim" },
    { "nvim-lua/popup.nvim" },
    { "jose-elias-alvarez/typescript.nvim" },
    -- TODO: try volarjs
    -- { "jose-elias-alvarez/typescript.nvim" },
    {
        "axelvc/template-string.nvim",
        event = "InsertEnter",
        ft = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
        },
        config = true, -- run require("template-string").setup()
    },
    {
        "lvimuser/lsp-inlayhints.nvim",
        branch = "main", -- or "anticonceal"
        config = function()
            require("plugins.inlay-hints")
        end,
    },
    {
        "dmmulroy/tsc.nvim",
        cmd = { "TSC" },
        config = true,
    },
    {
        "folke/trouble.nvim",
        branch = "dev",
        -- cmd = { "Trouble diagnostics toggle", "Trouble symbols toggle", "Trouble lsp toggle", "Trouble loclist toggle",
        --     "Trouble qflist toggle" },
        cmd = {"Trouble"},
        config = function()
            require("plugins.trouble")
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        cmd = { "ColorizerToggle" },
        config = function()
            require("plugins.colorizer")
        end
    },

    -- {
    -- 	"dnlhc/glance.nvim",
    -- 	-- config = true,
    -- 	config = function()
    --      require("plugins.glance")
    --    end,
    -- 	opts = {
    -- 		hooks = {
    -- 			before_open = function(results, open, jump, method)
    -- 				if #results == 1 then
    -- 					jump(results[1]) -- argument is optional
    -- 				else
    -- 					open(results) -- argument is optional
    -- 				end
    -- 			end,
    -- 		},
    -- 	},
    -- 	cmd = { "Glance" },
    -- 	keys = {
    -- 		{ "gd", "<cmd>Glance definitions<CR>", desc = "LSP Definition" },
    -- 		{ "gr", "<cmd>Glance references<CR>", desc = "LSP References" },
    -- 		{ "gm", "<cmd>Glance implementations<CR>", desc = "LSP Implementations" },
    -- 		{ "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" },
    -- 	},
    -- },

    -- General
    -- TODO deprecated or not? seems not to be working
    { "AndrewRadev/switch.vim",      lazy = false },
    {
        "Wansmer/treesj",
        lazy = true,
        cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
        config = function()
            require("treesj").setup({
                use_default_keymaps = false,
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        branch = "jsx",
        config = function()
            require("plugins.comment")
        end,
    },
    { "LudoPinelli/comment-box.nvim" },
    { "tpope/vim-repeat",            lazy = false },
    { "tpope/vim-speeddating",       lazy = false },
    { "dhruvasagar/vim-table-mode",  ft = { "markdown" } },
    -- TODO learn and practice with multi
    {
        "mg979/vim-visual-multi",
        keys = {
            "<C-n>",
            "<C-Up>",
            "<C-Down>",
            "<S-Up>",
            "<S-Down>",
            "<S-Left>",
            "<S-Right>",
        },
        config = function()
            vim.g.VM_leader = ";"
        end,
    },
    -- TODO don't understand
    {
        "nacro90/numb.nvim",
        lazy = false,
        config = function()
            require("plugins.numb")
        end,
    },
    {
        "folke/todo-comments.nvim",
        lazy = false,
        event = "BufEnter",
        config = function()
            require("plugins.todo-comments")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        lazy = true,
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("plugins.which-key")
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
            })
        end,
        init = function()
            local banned_messages = {
                "No information available",
                "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
                "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
            }
            vim.notify = function(msg, ...)
                for _, banned in ipairs(banned_messages) do
                    if msg == banned then
                        return
                    end
                end
                return require("notify")(msg, ...)
            end
        end,
    },
    -- TODO: investigate in better markdown-preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    -- TODO: What it does?
    {
        "Shatur/neovim-session-manager",
        lazy = false,
        config = function()
            require("plugins.session-manager")
        end,
    },
    {
        "rareitems/printer.nvim",
        event = "BufEnter",
        ft = {
            "lua",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
        },
        config = function()
            require("plugins.printer")
        end,
    },

    -- Snippets & Language & Syntax
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        config = function()
            require("config.luasnip")
        end,
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.autopairs")
        end,
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.git.signs")
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
        enabled = false,
        event = "BufRead",
        config = function()
            require("plugins.git.diffview")
        end,
    },
    {
        "akinsho/git-conflict.nvim",
        lazy = false,
        config = function()
            require("plugins.git.conflict")
        end,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        keys = {
            "<Leader>gwc",
            "<Leader>gww",
        },
        config = function()
            require("plugins.git.worktree")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitCurrentFile",
            "LazyGitFilterCurrentFile",
            "LazyGitFilter",
        },
        config = function()
            vim.g.lazygit_floating_window_scaling_factor = 1
        end,
    },

    -- Testing
    {
        "rcarriga/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "haydenmeade/neotest-jest",
        },
        config = function()
            require("plugins.neotest")
        end,
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {
            "Coverage",
            "CoverageSummary",
            "CoverageLoad",
            "CoverageShow",
            "CoverageHide",
            "CoverageToggle",
            "CoverageClear",
        },
        config = function()
            require("coverage").setup()
        end,
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("plugins.dap")
        end,
        keys = {
            "<Leader>da",
            "<Leader>db",
            "<Leader>dc",
            "<Leader>dd",
            "<Leader>dh",
            "<Leader>di",
            "<Leader>do",
            "<Leader>dO",
            "<Leader>dt",
        },
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mxsdev/nvim-dap-vscode-js",
            {
                "microsoft/vscode-js-debug",
                lazy = true,
                run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
            }
        },
    },

    -- Databases
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
        init = function()
            require('plugins.dadbod')
        end,
    }
}
