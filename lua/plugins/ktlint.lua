return { -- formata o código Kotlin
  'pinterest/ktlint',
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.kt,*.kts",
      callback = function()
        vim.cmd("silent! !ktlint -F %")
      end
    })
  end
}
