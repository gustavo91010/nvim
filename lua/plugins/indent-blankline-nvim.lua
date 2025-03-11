-- Indentation guides
return {
  "lukas-reineke/indent-blankline.nvim",
  event = 'VeryLazy',
  main = "ibl",
  opts = {
    enabled = true,
    indent = {
      char = '|', -- Guia de indentação padrão
    },
    exclude = {
      filetypes = { "java", "json", "kotlin" }, -- Esses arquivos não exibirão guias
    },
  },
}

-- return {
--   -- https://github.com/lukas-reineke/indent-blankline.nvim
--   "lukas-reineke/indent-blankline.nvim",
--   event = 'VeryLazy',
--   main = "ibl",
--   opts = {
--     enabled = true,
--     indent = {
--       char = '|', -- '|',
--     },
--   },
-- }
