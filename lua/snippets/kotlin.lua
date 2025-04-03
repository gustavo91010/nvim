local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

-- Carrega os snippets automaticamente
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })

-- Define os snippets para Kotlin
ls.add_snippets("kotlin", {

  s("opa", {
    t('print("opa!")')
  }),

  s({ trig = "%.var", regTrig = true }, {
    t({ "", "var " }),
    f(function(_, parent)
      local line = parent.snippet.env.LAST_TRIGGER
      return line:match("([%w_]+)%.var") or "minhaVariavel"
    end),
    t(" = ")
  }),
})
