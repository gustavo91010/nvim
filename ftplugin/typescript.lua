-- ~/.config/nvim/ftplugin/typescript.lua

-- Instalar o LSP:
-- npm install -g typescript-language-server typescript

local nvim_lsp = require('lspconfig')

-- Configuração do LSP para TypeScript
-- nvim_lsp.tsserver.setup({
  nvim_lsp.ts_ls.setup({

  on_attach = function(client, bufnr)
    -- Formatar ao salvar
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })

    -- Atalho para formatar manualmente
    vim.keymap.set('n', '<leader>gf', function()
      vim.lsp.buf.format({ async = false })
    end, { buffer = bufnr, desc = "Formatar código" })
  end,
  flags = {
    debounce_text_changes = 150,
  },
})

-- Autocompletar com nvim-cmp
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-y>"] = cmp.mapping.confirm(),
    ["<C-e>"] = cmp.mapping.abort(),
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-- -- Instalar o lsp typescritp
-- -- npm install -g typescript-language-server typescript

-- -- ~/.config/nvim/ftplugin/typescript.lua

-- -- Configuração do LSP para TypeScript (ts_ls)
-- local nvim_lsp = require('lspconfig')

-- -- Configuração do ts_ls para TypeScript e JavaScript
-- nvim_lsp.ts_ls.setup({
--   -- Formata o codigo ao salvar
--   on_attach = function(client, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format()
--       end,
--     })
--     vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { buffer = bufnr, desc = "Formatar código" })
--     -- Habilita a integração com o nvim-cmp
--     -- require('completion').on_attach(client, bufnr)
--   end,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- })

-- -- Configuração do nvim-cmp para autocompletar
-- local cmp = require('cmp')

-- cmp.setup({
--   mapping = {
--     ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--     ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--     ["<C-y>"] = cmp.mapping.confirm(),
--     ["<C-e>"] = cmp.mapping.abort(),
--   },
--   sources = {
--     { name = 'buffer' },
--     { name = 'nvim_lsp' }, -- LSP para autocompletar
--     { name = 'path' },
--   },
--   snippet = {
--     expand = function(args)
--       require 'luasnip'.lsp_expand(args.body)
--     end,
--   },
-- })

-- -- Habilitar a formatação automática ao salvar
-- vim.api.nvim_set_keymap('n', '<leader>gf', ':lua vim.lsp.buf.formatting_sync()<CR>',
--   { noremap = true, silent = true, desc = "Formatar código" })
