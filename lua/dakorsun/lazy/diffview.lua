return {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = true,
    event = "BufRead",
    config = function()
        local lib = require("diffview.lib")
        local diffview = require("diffview")


        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Custom Ecovim toggle file history function via <leader>gd│
        -- ╰──────────────────────────────────────────────────────────╯
        -- M.toggle_file_history = function()
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

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Custom Ecovim toggle status function via <leader>gs      │
        -- ╰──────────────────────────────────────────────────────────╯
        -- M.toggle_status = function()
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
}
