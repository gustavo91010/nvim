local cmp = require('cmp')

if not luasnip then
  print("LuaSnip não carregado!")
end

if cmp then
  cmp.setup {
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
      { name = 'buffer',   keyword_length = 3 },  -- only start autocompleting after a few chars typed
      { name = 'nvim_lsp', max_item_count = 10 }, -- don't overpopulate list with symbols from LSP
    },
    -- Just for aesthetics
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  }

  vim.api.nvim_set_keymap('n', '<leader>gf', ':lua vim.lsp.buf.format { async = true }<CR>',
    { noremap = true, silent = true, desc = "Formatar código" })

  -- Mapeamento para "Go to Definition"
  vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = true, desc = "Ir para definição" })

  vim.api.nvim_set_keymap('n', '<leader>ga', ':lua vim.lsp.buf.code_action()<CR>',
    { noremap = true, silent = true, desc = "Ações de código" })
else
  print("nvim-cmp não carregado!")
end
