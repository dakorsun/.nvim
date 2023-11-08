-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, "typescript")
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")

if not mason_ok or not mason_lsp_ok then
    return
end

mason.setup({
    ui = {
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",
    },
})

mason_lsp.setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {
        "bashls",
        "cssls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "tailwindcss",
        "angularls",
        "tsserver",
        "prismals",
        "rust_analyzer",
    },
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        silent = true,
        border = "rounded",
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics
    ),
}

local function on_attach(client, bufnr)
    -- set up buffer keymaps, etc.
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- Order matters

-- It enables tsserver automatically so no need to call lspconfig.tsserver.setup
if typescript_ok then
    typescript.setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false,            -- enable debug logging for commands
        -- LSP Config options
        server = {
            capabilities = require("lsp.servers.tsserver").capabilities,
            --      handlers = require("lsp.servers.tsserver").handlers,
            on_attach = require("lsp.servers.tsserver").on_attach,
            settings = require("lsp.servers.tsserver").settings,
        },
        init_options = {
            preferences = {
                disableSuggestions = true,
            }
        }
    })
end

-- lspconfig.tailwindcss.setup({
--   capabilities = require("lsp.servers.tailwindcss").capabilities,
--   filetypes = require("lsp.servers.tailwindcss").filetypes,
--   -- handlers = handlers,
--   init_options = require("lsp.servers.tailwindcss").init_options,
--   on_attach = require("lsp.servers.tailwindcss").on_attach,
--   settings = require("lsp.servers.tailwindcss").settings,
-- })

lspconfig.cssls.setup({
    capabilities = capabilities,
    -- handlers = handlers,
    on_attach = require("lsp.servers.cssls").on_attach,
    settings = require("lsp.servers.cssls").settings,
})

lspconfig.html.setup({
    capabilities = capabilities,
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        -- Supposed to be disabled since most of mine html managed via eslint+prettier
        provideFormatter = false
    }
})

lspconfig.eslint.setup({
    capabilities = capabilities,
    -- handlers = handlers,
    on_attach = require("lsp.servers.eslint").on_attach,
    settings = require("lsp.servers.eslint").settings,
    filetypes = require("lsp.servers.eslint").filetypes,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
    -- handlers = handlers,
    on_attach = on_attach,
    settings = require("lsp.servers.jsonls").settings,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    -- handlers = handlers,
    on_attach = on_attach,
    settings = require("lsp.servers.lua_ls").settings,
})

lspconfig.vuels.setup({
    filetypes = require("lsp.servers.vuels").filetypes,
    -- handlers = handlers,
    init_options = require("lsp.servers.vuels").init_options,
    on_attach = require("lsp.servers.vuels").on_attach,
    settings = require("lsp.servers.vuels").settings,
})

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer"
    }
    -- settings = {
    --   rust = {
    --     unstable_features = true,
    --     build_on_save = false,
    --     all_features = true,
    --   },
    -- },
})

for _, server in ipairs({ "bashls", "graphql", "emmet_ls", "html", "angularls", "prismals" }) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        -- handlers = handlers,
    })
end
