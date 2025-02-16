return { -- formata o codgo kotlin
  'pinterest/ktlint',
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", { -- quando salvar
      pattern = "*.kt,*.kts",
      callback = function()
        vim.cmd("silent! !ktlint -F %")
      end
    })
  end
}

