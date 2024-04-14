local M = {}

local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

M.on_attach = on_attach;

local filetypes = { "html", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
    "typescript.tsx", "vue", "svelte", "astro", "yaml" }

M.filetypes = filetypes

M.settings = {
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

return M
