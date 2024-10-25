local primeagen_plugins = {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-u>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-i>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-o>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-u>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-i>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-o>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-p>", function() harpoon:list():replace_at(4) end)
            --Unleash your Dvorak
            --[[ vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-t>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-n>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-s>", function() harpoon:list():replace_at(4) end) ]]
        end
    },
    {
        "ThePrimeagen/vim-apm",
        config = function()
            local apm = require("vim-apm")

            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
        end
    }
}

return primeagen_plugins

