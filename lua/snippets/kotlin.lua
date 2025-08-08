local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

ls.add_snippets("kotlin", {
  s("sysout", { t('println()') }),

  s("package", {
    t("package "),
    f(function()
      local path = vim.fn.expand("%:p:h")
      local idx = path:find("/com")
      if idx then
        path = path:sub(idx + 1)
      end
      return path:gsub("/", ".")
    end, {}),
  }),

  s("newvar", {
    t("var "), i(1, "newVar"), t(" = "),
    d(2, function(args)
      if args[1][1] == "" then
        return sn(nil, i(1, "valor"))
      else
        return sn(nil, t(args[1][1]))
      end
    end, {0})
  }),

  s("newval", {
  t("val "), i(1, "newVal"), t(" = "),
  d(2, function(args)
    if args[1][1] == "" then
      return sn(nil, i(1, "valor"))
    else
      return sn(nil, t(args[1][1]))
    end
  end, {0})
}),

})
