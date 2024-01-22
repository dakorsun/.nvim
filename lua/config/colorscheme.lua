local present, rose_pine = pcall(require, "rose-pine")
if not present then
    return
end

require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    -- variant = 'auto',
    variant = 'moon',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'moon',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = false,
    disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        -- background = 'base',
        -- background_nc = '_experimental_nc',
        -- panel = 'surface',
        -- panel_nc = 'base',
        -- border = 'highlight_med',
        -- comment = 'muted',
        -- link = 'iris',
        -- punctuation = 'subtle',
        --
        -- error = 'love',
        -- hint = 'iris',
        -- info = 'foam',
        -- warn = 'gold',
        --
        -- headings = {
        --   h1 = 'iris',
        --   h2 = 'foam',
        --   h3 = 'rose',
        --   h4 = 'gold',
        --   h5 = 'pine',
        --   h6 = 'foam',
        -- }

        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
        },

        -- or set all headings at once
        -- headings = 'subtle'
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
        ColorColumn = { bg = 'rose' },

        -- Blend colours against the "base" background
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = 'love', bg = 'love', blend = 10 },
    }
})

-- Set Colorscheme
vim.cmd("colorscheme " .. MyNeovim.colorscheme)

-- MyNeovimColors
vim.api.nvim_set_hl(0, "MyNeovimPrimary", { fg = "#488dff" })
vim.api.nvim_set_hl(0, "MyNeovimSecondary", { fg = "#FFA630" })

vim.api.nvim_set_hl(0, "MyNeovimPrimaryBold", { bold = true, fg = "#488DFF" })
vim.api.nvim_set_hl(0, "MyNeovimSecondaryBold", { bold = true, fg = "#FFA630" })

vim.api.nvim_set_hl(0, "MyNeovimHeader", { bold = true, fg = "#488DFF" })
vim.api.nvim_set_hl(0, "MyNeovimHeaderInfo", { bold = true, fg = "#FFA630" })
vim.api.nvim_set_hl(0, "MyNeovimFooter", { bold = true, fg = "#FFA630" })

-- RosePine Colorscheme Specific Config
if MyNeovim.colorscheme == "rose-pine" then
    -- Lines
    vim.api.nvim_set_hl(0, "CursorLineNR", { link = "MyNeovimSecondary" })
    vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })

    -- Floats/Windows
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None", fg = "#488DFF" })
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "None", fg = "#488DFF" })
    vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = "None" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "#16161e", fg = "#16161e" })
    vim.api.nvim_set_hl(0, "BqfPreviewBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "BufferInactiveIndex", { link = "BufferInactive" })

    -- Tree
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { bg = "None", fg = "None" })

    -- Diagnostics

    -- Misc
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "None" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "None" })
    vim.api.nvim_set_hl(0, "Boolean", { fg = "#F7768E" })
    vim.api.nvim_set_hl(0, "BufferOffset", { link = "MyNeovimSecondary" })

    -- Completion Menu Colors
    --  local highlights = {
    --    CmpItemAbbr = { fg = c.dark3, bg = "NONE" },
    --    CmpItemKindClass = { fg = c.orange },
    --    CmpItemKindConstructor = { fg = c.purple },
    --    CmpItemKindFolder = { fg = c.blue2 },
    --    CmpItemKindFunction = { fg = c.blue },
    --    CmpItemKindInterface = { fg = c.teal, bg = "NONE" },
    --    CmpItemKindKeyword = { fg = c.magneta2 },
    --    CmpItemKindMethod = { fg = c.red },
    --    CmpItemKindReference = { fg = c.red1 },
    --    CmpItemKindSnippet = { fg = c.dark3 },
    --    CmpItemKindVariable = { fg = c.cyan, bg = "NONE" },
    --    CmpItemKindText = { fg = "LightGrey" },
    --    CmpItemMenu = { fg = "#C586C0", bg = "NONE" },
    --    CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
    --    CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
    --  }
    --
    --  vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = c.blue0 })
    --
    --  for group, hl in pairs(highlights) do
    --    vim.api.nvim_set_hl(0, group, hl)
    --  end
end
