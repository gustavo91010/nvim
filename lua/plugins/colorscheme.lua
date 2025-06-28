-- -- O vermelho e amareo, esse é massa
return {
  "AlessandroYorba/Alduin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.alduin_Shout_Aura_Whisper = 1 -- Troca o matchparen por sublinhado
    vim.g.alduin_Shout_Fire_Breath = 1  -- vermelho nos highlights
    -- Ativa o tema
    vim.cmd("colorscheme alduin")

    -- Define fundo transparente
    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight StatusLine guibg=NONE ctermbg=NONE
      highlight LineNr guibg=NONE ctermbg=NONE
    ]])
  end,
}

-- return {
--   "nanotech/jellybeans.vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme jellybeans")

--     -- Transparência
--     vim.cmd([[
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight NormalNC guibg=NONE ctermbg=NONE
--       highlight VertSplit guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight StatusLine guibg=NONE ctermbg=NONE
--       highlight LineNr guibg=NONE ctermbg=NONE
--     ]])

--     -- Estilo
--     vim.cmd([[
--       highlight Comment gui=italic
--       highlight Keyword gui=bold
--     ]])
--   end,
-- }

-- Modelo basico
-- return {
--   "nanotech/jellybeans.vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme jellybeans")
--   end,
-- }


-- Oficial
-- return {
--   'deparr/tairiki.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('tairiki').setup {
--       style = 'dark',
--       transparent = true, -- Fundo transparente
--       term_colors = true,
--       ending_tildes = false,
--       cmp_itemkind_reverse = false,
--       visual_bold = false,

--       toggle_style_key = nil,
--       toggle_style_list = { 'dark' },

--       code_style = {
--         comments = 'italic',
--         keywords = 'bold',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--       },

--       lualine = {
--         transparent = true,
--       },

--       colors = {
--         bg = "#000000",   -- Fundo preto
--         -- bg = "NONE",         -- Fundo transparente
--         --       bg = "#99CC99",         -- Fundo transparente
--         -- fg = "#C0C0C0",      -- Texto principal (cinza claro)
--         -- red = "#FF6666",     -- Erros e alertas (vermelho Eclipse)
--         -- green = "#99CC99",   -- Código válido (verde Eclipse)
--         -- yellow = "#FFFF99",  -- Strings (amarelo Eclipse)
--         -- blue = "#6699CC",    -- Nomes de funções e classes (azul Eclipse)
--         -- magenta = "#CC99CC", -- Palavras-chave (roxo Eclipse)
--         -- cyan = "#66CCCC",    -- Variáveis (ciano Eclipse)
--         -- orange = "#FF9966",  -- Atributos e números (laranja Eclipse)
--       },

--       highlights = {
--         -- Normal   = { fg = "#C0C0C0", bg = "NONE" },
--         Normal   = { fg = "#C0C0C0", bg = "#000000" },
--         Comment  = { fg = "#999999", italic = true },
--         Keyword  = { fg = "#CC99CC", bold = true },
--         Function = { fg = "#6699CC", bold = true },
--         String   = { fg = "#FFFF99", bold = true },
--         Variable = { fg = "#66CCCC", bold = true },
--         Number   = { fg = "#FF9966", bold = true },
--         Type     = { fg = "#99CC99", bold = true },
--       },

--       diagnostics = {
--         darker = true,
--         undercurl = true,
--         background = true,
--       },
--     }
--     require('tairiki').load()
--   end,
-- }
