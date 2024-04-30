return {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerToggle" },
    config = function()
        require("colorizer").setup({
            user_default_options = {
                -- mode = "foreground"
                mode = "background"
                -- mode = "virtualtext"
            }
        })
        vim.keymap.set('n', '<leader>ic', "<cmd>ColorizerToggle<cr>")
    end
}
