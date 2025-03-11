local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Carrega os snippets automaticamente
-- require("luasnip.loaders.from_lua").lazy_load()
-- require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/snippets" } })
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })

-- Define o snippet para Kotlin
ls.add_snippets("kotlin", {
  s("opa", {
    t('print("opa!")')
  }),
})

-- Recarrega os snippets ao salvar
vim.cmd([[
  augroup LuaSnip
    autocmd!
    autocmd BufWritePost *.lua source <afile> | LuaSnipUnlinkCurrent
  augroup END
]])

