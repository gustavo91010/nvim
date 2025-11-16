return {
  "nvimtools/none-ls.nvim",
  optional = false,
  opts = function(_, opts)
    local nls = require("null-ls")

    -- Adiciona ktlint como formatador e linter
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- nls.builtins.formatting.ktlint,
      -- nls.builtins.diagnostics.ktlint,
         -- JSON/YAML/Markdown
      nls.builtins.formatting.prettierd,
      -- npm install -g @fsouza/prettierd

      -- nls.builtins.formatting.jq,
      -- nls.builtins.formatting.xmllint,
      -- sudo apt install jq libxml2-utils

    })

    -- Formatação automática ao salvar
    opts.on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
       

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

