return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,           -- JSON, JavaScript, etc.
        null_ls.builtins.formatting.black,              -- Python
        null_ls.builtins.formatting.stylua,             -- Lua
        null_ls.builtins.formatting.google_java_format, -- Java
        null_ls.builtins.formatting.shfmt,              -- Shell
        null_ls.builtins.formatting.dockfmt,            -- Dockerfile
      },
    })
    -- Formatar automaticamente ao salvar
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.json", "*.java", "*.py", "*.lua", "*.sh", "Dockerfile" },
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end

}
-- tive que instalar o go sudo apt install -y golang

-- Tive que instalr o go install github.com/jessfraz/dockfmt@latest
