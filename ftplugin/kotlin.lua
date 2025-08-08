print("ftplugin/kotlin.lua carregado")

-- Configuração para autocompletar Kotlin usando nvim-cmp e LuaSnip

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Garante que snippets customizados sejam carregados
-- require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })


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
    { name = 'luasnip' }, -- agora snippets funcionam
    { name = 'buffer',   keyword_length = 3 },
    { name = 'nvim_lsp', max_item_count = 10 },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}

-- Atalhos úteis
vim.api.nvim_set_keymap('n', '<leader>gf', ':lua vim.lsp.buf.format { async = true }<CR>',
  { noremap = true, silent = true, desc = "Formatar código" })

vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>',
  { noremap = true, silent = true, desc = "Ir para definição" })

vim.api.nvim_set_keymap('n', '<leader>ga', ':lua vim.lsp.buf.code_action()<CR>',
  { noremap = true, silent = true, desc = "Ações de código" })

