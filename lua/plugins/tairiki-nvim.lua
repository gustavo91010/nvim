return {
  -- https://github.com/deparr/tairiki.nvim

  'deparr/tairiki.nvim',
  lazy = false,
  priority = 100, -- necessário apenas se você usar o tairiki como tema padrão
  config = function()
    require('tairiki').setup {
      -- Opções principais --
      style = 'dark', -- Estilo padrão do tema. Escolha entre 'dark', 'light' e 'dimmed'
      transparent = false,  -- Mostrar/ocultar o fundo
      term_colors = true, -- Mudar as cores do terminal conforme o estilo do tema selecionado
      ending_tildes = false, -- Mostrar as tilde de fim de buffer. Por padrão, estão ocultas
      cmp_itemkind_reverse = false, -- Inverter os destaques de tipo de item no menu do cmp
      visual_bold = false, -- Deixar seleções visuais em negrito

      -- Alternar estilo do tema ---
      toggle_style_key = nil, -- Tecla de atalho para alternar o estilo do tema. Deixe como nil para desativar, ou defina como uma string, por exemplo "<leader>ts"
      toggle_style_list = { 'dark' }, -- Estilos que a tecla de atalho `toggle_style_key` irá percorrer

      -- Mudar estilo do código ---
      -- As opções são italic, bold, underline, none
      -- Você pode configurar múltiplos estilos separados por vírgula. Por exemplo, keywords = 'italic,bold'
      code_style = {
        comments = 'italic', -- Estilo de comentário
        keywords = 'none', -- Estilo de palavras-chave
        functions = 'none', -- Estilo de funções
        strings = 'none', -- Estilo de strings
        variables = 'none' -- Estilo de variáveis
      },

      -- Opções do Lualine --
      lualine = {
        transparent = false, -- Transparência da barra central do lualine
      },

      -- Destaques personalizados --
      colors = {}, -- Substituir as cores padrão
      highlights = {}, -- Substituir os grupos de destaque

      -- Configuração dos Plugins --
      diagnostics = {
        darker = true, -- Cores mais escuras para diagnóstico
        undercurl = true,   -- Usar undercurl em vez de sublinhado para diagnósticos
        background = true,    -- Usar cor de fundo para texto virtual
      },
    }
--    require('tairiki').load() -- necessário para usar como tema padrão, se comporta como ':colorscheme tairiki'
  end,
}

