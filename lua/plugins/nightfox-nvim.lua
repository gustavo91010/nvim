return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,

    config = function()
      -- Opções padrão
      require('nightfox').setup({
        options = {
          -- Localização do arquivo compilado
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Sufixo do arquivo compilado
          transparent = true,         -- Desativa a configuração do plano de fundo
          terminal_colors = true,      -- Define cores do terminal (vim.g.terminal_color_*) usadas no `:terminal`
          dim_inactive = false,        -- Painéis não focados usam um fundo alternativo
          module_default = true,       -- Valor padrão de ativação para módulos
          colorblind = {
            enable = false,            -- Ativa suporte para daltonismo
            simulate_only = true,      -- Apenas simula as cores para daltonismo, sem alterar a paleta original
            severity = {
              protan = 0,              -- Intensidade [0,1] para protanopia (vermelho)
              deutan = 0,              -- Intensidade [0,1] para deuteranopia (verde)
              tritan = 0,              -- Intensidade [0,1] para tritanopia (azul)
            },
          },
          styles = {     -- Estilos aplicados a diferentes grupos de sintaxe
            comments = "NONE", -- Qualquer valor válido de `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Destaca inversamente diferentes tipos
            match_paren = false, -- Parênteses correspondentes
            visual = false,      -- Seleção visual
            search = false,      -- Pesquisa
          },
          modules = { -- Lista de vários plugins e opções adicionais
            -- ...
          },
        },
        palettes = {}, -- Personalização de paletas de cores
        specs = {},    -- Especificações de cores personalizadas
        groups = {},   -- Grupos de destaque personalizados
      })

      -- A configuração deve ser chamada antes de carregar o tema
      vim.cmd("colorscheme nightfox")
      -- vim.cmd("colorscheme nordfox") -- Alternativa: dayfox, dawnfox, duskfox, terafox

    end
  }
}

