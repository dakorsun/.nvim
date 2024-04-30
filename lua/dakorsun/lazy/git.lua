return {
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitCurrentFile",
            "LazyGitFilterCurrentFile",
            "LazyGitFilter",
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>",                  desc = "LazyGit" },
            { "<leader>la", "<cmd>LazyGitFilter<cr>",            desc = "LazyGitFilter" },
            { "<leader>lc", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGitFilterCurrentFile" },
        },
        config = function()
            vim.g.lazygit_floating_window_scaling_factor = 1
        end
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
        enabled = true,
        event = "BufRead",
        config = function()
            local lib = require("diffview.lib")
            local diffview = require("diffview")


            local toggle_file_history = function()
                local view = lib.get_current_view()
                if view == nil then
                    diffview.file_history();
                    return
                end

                if view then
                    view:close()
                    lib.dispose_view(view)
                end
            end

            local toggle_status = function()
                local view = lib.get_current_view()
                if view == nil then
                    diffview.open();
                    return
                end

                if view then
                    view:close()
                    lib.dispose_view(view)
                end
            end
            vim.keymap.set("n", "<leader>gd", toggle_file_history, { desc = "diff file" })
            vim.keymap.set("n", "<leader>gs", toggle_status, { desc = "status" })
        end,
        keys = {},
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    }
}
