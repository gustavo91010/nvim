return {
  "nvimtools/none-ls.nvim",
  optional = false,
  opts = function(_, opts)
    local nls = require("null-ls")

    -- Adiciona ktlint como formatador e linter
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.ktlint,
      nls.builtins.diagnostics.ktlint,
    })

    -- Formatação automática ao salvar
    opts.on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   group = augroup,
        --   buffer = bufnr,
        --   callback = function()
        --     vim.lsp.buf.format({ bufnr = bufnr })
        --   end,
        -- })

        -- Tecla manual de formatação
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "<leader>gf",
          "<cmd>lua vim.lsp.buf.format({ bufnr = bufnr })<CR>",
          { noremap = true, silent = true, desc = "Formatar arquivo" }
        )
      end
    end
  end,
}

