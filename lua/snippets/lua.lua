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

