-- evita setup duplicado do kotlin_language_server
if vim.g._kls_setup then
  return
end
vim.g._kls_setup = true
-- ===============================
-- LSP Kotlin
-- ===============================
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, bufnr)
  -- Desativa formatação pelo LSP (usaremos null-ls/ktlint)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>gf', function() vim.lsp.buf.format { async = true } end, opts)
end


-- local root_pattern = function(fname)
--   return lspconfig.util.root_pattern("pom.xml", ".git")(fname)
-- end

local root_pattern = function(fname)
  return lspconfig.util.root_pattern(
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    "settings.gradle",
    "settings.gradle.kts",
    ".git"
  )(fname)
end


-- Garante que o classpath Maven exista
local project_root = vim.fn.getcwd()
local classpath_file = project_root .. "/.kls-classpath"

if vim.fn.filereadable(classpath_file) == 0 then
  print("Gerando .kls-classpath...")
  vim.fn.system("mvn dependency:build-classpath -Dmdep.outputFile=.kls-classpath")
end
-- Configuração do servidor Kotlin
lspconfig.kotlin_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = root_pattern,
  cmd = { "kotlin-language-server" },
})

-- ===============================
-- Autocompletar com nvim-cmp + LuaSnip
-- ===============================
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Carregar snippets customizados
require("luasnip.loaders.from_lua").lazy_load({
  paths = vim.fn.stdpath("config") .. "/lua/snippets"
})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete_common_string(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm(),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'nvim_lsp', max_item_count = 10 },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}


-- garantir esses executores no plugin do pon do kotlin:expand


--         <plugin>
--         <groupId>org.jetbrains.kotlin</groupId>
--         <artifactId>kotlin-maven-plugin</artifactId>
--         <!-- tem que ter esses executores para o nvim reconhecer o kotlin -->
--         <executions>
--           <execution>
--             <id>compile</id>
--             <phase>compile</phase>
--             <goals>
--               <goal>compile</goal>
--             </goals>
--           </execution>
--           <execution>
--             <id>test-compile</id>
--             <phase>test-compile</phase>
--             <goals>
--               <goal>test-compile</goal>
--             </goals>
--           </execution>
--         </executions>

--         <configuration>
--           <args>
--             <arg>-Xjsr305=strict</arg>
--           </args>
--           <compilerPlugins>
--             <plugin>spring</plugin>
--           </compilerPlugins>
--         </configuration>
--         <dependencies>
--           <dependency>
--             <groupId>org.jetbrains.kotlin</groupId>
--             <artifactId>kotlin-maven-allopen</artifactId>
--             <version>${kotlin.version}</version>
--           </dependency>
--         </dependencies>
--       </plugin>

