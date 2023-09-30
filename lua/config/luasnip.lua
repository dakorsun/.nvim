local ls = require("luasnip")

print("luasnip init")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

local types = require("luasnip.util.types")
-- Every unspecified option will be set to the default.
ls.config.set_config({
  history = true,                           --keep around last snippet local to jump back
  updateevents = "TextChanged,TextChangedI", --update changes as you type
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
    [types.insertNode] = {
    	active = {
    		virt_text = { { "●", "GruvboxBlue" } },
    	},
    },
  },
})

vim.keymap.set({ "i", "s" }, "<C-x>", function()
  if ls.expand_or_jumpable() then
    ls.expand()
  end
end)

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end)

vim.keymap.set({ "i", "s" }, "<C-g>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set("n", "<Leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
