local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("java", {
  s("opa", { t('System.out.println("opa!");') }),
})

