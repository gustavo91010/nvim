local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node  -- Importa a função `f`

ls.add_snippets("java", {
  s("junit", {
    t({ "import org.junit.jupiter.api.Test;", "", "import static org.junit.jupiter.api.Assertions.*;", "", "" }),
    t("public class "), i(1, "TestClass"), t({ " {", "    " }),
    t("@Test"), t({ "", "    public void testMethod() {", "        " }),
    i(2, "// TODO: Implement test"),
    t({ "", "    }", "}" }),
  })
})

-- Snippet para específico para Kotlin
ls.add_snippets("kotlin", {
  -- cria um package
  s("package", {
    t("package "),
    f(function()
      -- Pega o diretório atual e converte para o formato de pacote Kotlin
      return vim.fn.expand("%:p:h"):gsub("/", ".")
    end, {}),
    t(";")
  }),

  -- Snippet para fazer o .var
  ls.add_snippets("kotlin", {
    s("newvar", {
    -- s(".var", {
      t("var "), i(1, "newVar"), t(" = "), t("ClasseName()")
    }),
  })
})
