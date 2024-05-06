require('dakorsun.set')
require('dakorsun.remap')
require('dakorsun.lazy_init')

local augroup = vim.api.nvim_create_augroup
local DakorsunGroup = augroup('dakorsun', { clear = true })

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- autocmd({"BufWritePre"}, {
--     group = DakorsunGroup,
--     pattern = "*",
--     command = [[%s/\s\+$//e]],
-- })

autocmd('LspAttach', {
    group = DakorsunGroup,
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map("gd", function() vim.lsp.buf.definition() end, "[G]oto [D]efinition")
        map("K", function() vim.lsp.buf.hover() end, "Hover Documentation")
        map("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, "Workspace symbol")
        map("<leader>vd", function() vim.diagnostic.open_float() end, "Open Float")
        map("<leader>vca", function() vim.lsp.buf.code_action() end, "Code Action")
        map("<leader>vrr", function() vim.lsp.buf.references() end, "References")
        map("<leader>vrn", function() vim.lsp.buf.rename() end, "Rename")
        map("<leader>dj", function() vim.diagnostic.goto_next() end, "Goto Next")
        map("<leader>dk", function() vim.diagnostic.goto_prev() end, "Goto Prev")
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc = "Signature help"})
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
        end
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
        end
    end
})

autocmd('LspDetach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
    callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = event.buf })
    end,
})

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
