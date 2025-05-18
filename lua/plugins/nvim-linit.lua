-- Adicionei para ver se o kotlin fica melhor
return {
  "mfussenegger/nvim-lint",
  optional = true,
  dependencies = "mason-org/mason.nvim",
  opts = {
    linters_by_ft = { kotlin = { "ktlint" } },
  },
}
