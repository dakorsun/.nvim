return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitCurrentFile",
        "LazyGitFilterCurrentFile",
        "LazyGitFilter",
    },
    config = function()
        vim.g.lazygit_floating_window_scaling_factor = 1
        vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")
        vim.keymap.set("n", "<leader>ga", "<cmd>LazyGitFilter<CR>")
        vim.keymap.set("n", "<leader>gc", "<cmd>LazyGitFilterCurrentFile<CR>")
    end,
}
