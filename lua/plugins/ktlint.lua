return { -- formata o codgo kotlin
  'pinterest/ktlint',
  config = function()
    -- vim.api.nvim_create_autocmd("BufWritePre", { -- quando salvar
    --   pattern = "*.kt,*.kts",
    --   callback = function()
    --     vim.cmd("silent! !ktlint -F %")
    --   end
    -- })
  end
}
--  nem precisou segur a linha de baixo, coloquei 
--  Desabilitei a prioridade do language server na formataçao com o coamdno
--      client.server_capabilities.documentFormattingProvider = false
--      la no lsp config... e foi o suficianete..
--      vou deixat aqui só para mantero historido...
-- Comentei ess alinha, o null-ls ja esta fazendo essa formatação
--   Isso quando começei desenvolver o mobile de novo...
--   se der problema, tarz esse aqui de volta... 18/05/25
