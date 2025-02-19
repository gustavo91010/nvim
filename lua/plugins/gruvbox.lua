return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      -- Ajustes para deixar o tema mais próximo do "Dark Classic"
      vim.g.gruvbox_contrast_dark = "hard"       -- Aumenta o contraste para fundo mais escuro
      vim.g.gruvbox_invert_selection = 0         -- Mantém o fundo da seleção escuro
      vim.g.gruvbox_bold = 1                     -- Habilita negrito
      vim.g.gruvbox_italic = 1                   -- Habilita itálico
      vim.g.gruvbox_italicize_strings = 1        -- Habilita itálico em strings
      vim.g.gruvbox_material_background = "hard" -- Configura o fundo para mais escuro
      vim.g.gruvbox_invert_indent_guides = 1     -- Inverte os guias de recuo
      vim.g.gruvbox_invert_signs = 1             -- Inverte os sinais do GitGutter e Syntastic
      vim.g.gruvbox_invert_tabline = 1           -- Inverte a linha de abas

      -- Aplica o tema
      vim.cmd("colorscheme gruvbox")

      -- Definindo fundo transparente
      vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Fundo transparente para a área normal
      vim.cmd("hi NonText guibg=NONE ctermbg=NONE") -- Fundo transparente para caracteres não visíveis
      vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")  -- Fundo transparente para números das linhas

      -- Destacar palavras-chave, funções e outras estruturas
      vim.cmd("hi Keyword guifg=#fe8019")  -- Altera a cor das palavras-chave para laranja
      vim.cmd("hi Function guifg=#8ec07c") -- Altera a cor das funções para verde claro

      -- Aplica as configurações de highlight de pesquisa
      vim.cmd([[
        set hlsearch
        set incsearch
        augroup VimHighlight
          autocmd!
          autocmd CursorMoved * silent! call matchdelete(999)
          autocmd CursorMoved * silent! call matchadd('Search', '\V\<'.expand('<cword>').'\>', 999, 999)
        augroup END
      ]])

      -- Definindo cores para a pesquisa
      vim.cmd("hi Search guifg=#d5c4a1 guibg=#3c3836")    -- Cor suave para o Search
      vim.cmd("hi IncSearch guifg=#d79921 guibg=#504945") -- Cor suave para o IncSearch
    end
  }
}
