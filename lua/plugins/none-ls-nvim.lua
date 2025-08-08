return {
  "nvimtools/none-ls.nvim",
  optional = false,
  opts = function(_, opts)
    local nls = require("null-ls")
    -- opts.sources = vim.list_extend(opts.sources or {}, {
    --   nls.builtins.formatting.ktlint,
    --   nls.builtins.diagnostics.ktlint,
    -- })

    opts.on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        -- -- vim.api.nvim_create_autocmd("BufWritePre", { comentei o autor formatador, por que ja to usando o .editorconfig na raiz do projrto
        -- --   group = augroup,
        -- --   buffer = bufnr,
        -- --   callback = function()
        -- --     vim.lsp.buf.format({ bufnr = bufnr })
        -- --   end,
        -- -- })

        -- -- Mapeamento para formatar manualmente com <leader>f
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({ bufnr = bufnr })<CR>", { noremap=true, silent=true, desc = "Formatar arquivo" })
      end
    end
  end,
}

-- return {
  -- "nvimtools/none-ls.nvim",
  -- optional = false,
  -- opts = function(_, opts)
  --   local nls = require("null-ls")
  --   opts.sources = vim.list_extend(opts.sources or {}, {
  --     nls.builtins.formatting.ktlint,
  --     nls.builtins.diagnostics.ktlint,
  --   })

  --   opts.on_attach = function(client, bufnr)
  --     if client.supports_method("textDocument/formatting") then
  --       local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  --       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --       vim.api.nvim_create_autocmd("BufWritePre", {
  --         group = augroup,
  --         buffer = bufnr,
  --         callback = function()
  --           vim.lsp.buf.format({ bufnr = bufnr })
  --         end,
  --       })
  --     end
  --   end
  -- end,
-- }

-- return {
--   "nvimtools/none-ls.nvim",
--   optional = false,  -- true,
--   opts = function(_, opts)
--     local nls = require("null-ls")
--     opts.sources = vim.list_extend(opts.sources or {}, {
--       nls.builtins.formatting.ktlint,
--       nls.builtins.diagnostics.ktlint,
--     })
--   end,
-- }
