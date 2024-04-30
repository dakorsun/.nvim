return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        vim.keymap.set('n', '<leader>sc', '<cmd>Telescope colorscheme<CR>')

        -- Git
        vim.keymap.set('n', '<leader>gB', '<cmd>Telescope git_branches<CR>')
        vim.keymap.set('n', '<leader>glA', '<cmd>Telescope my_git_commits<CR>')
        vim.keymap.set('n', '<leader>glC', '<cmd>Telescope my_git_bcommits<CR>')
        vim.keymap.set('n', '<leader>gS', '<cmd>Telescope git_status<CR>')
        vim.keymap.set('n', '<leader>glA', '<cmd>Telescope my_git_commits<CR>')
    end
}
