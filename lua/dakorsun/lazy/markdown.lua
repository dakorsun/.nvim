return {
    -- {
    --     'MeanderingProgrammer/markdown.nvim',
    --     name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    --     dependencies = { 'nvim-treesitter/nvim-treesitter' },
    --     config = function()
    --         require('render-markdown').setup({})
    --     end,
    -- },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
