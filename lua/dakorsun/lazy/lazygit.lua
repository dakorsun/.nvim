return {
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
}
