return {
  -- Outros plugins
  {
    "vim-test/vim-test",
    config = function()
      -- Estratégia de execução de testes
      vim.g['test#strategy'] = 'neovim'  -- Usando o Neovim para rodar os testes
      
      -- Configuração para Java
      vim.g['test#java#runner'] = 'maven' -- 'gradle'  -- Usando Gradle para rodar os testes (ou 'maven', se for o caso)

      -- Configuração para Kotlin (usando o Gradle ou Maven, já que é o mais comum para Kotlin)
      vim.g['test#kotlin#runner'] = 'gradle'  -- Usando Gradle para rodar os testes
    end
  }
}

