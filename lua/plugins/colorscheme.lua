return {
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"       -- Aumenta o contraste para fundo mais escuro
      vim.g.gruvbox_invert_selection = 0         -- Mantém o fundo da seleção escuro
      vim.g.gruvbox_bold = 1                     -- Habilita negrito
      vim.g.gruvbox_italic = 1                   -- Habilita itálico
      vim.g.gruvbox_italicize_strings = 1        -- Habilita itálico em strings
      vim.g.gruvbox_material_background = "hard" -- Configura o fundo para mais escuro
      vim.g.gruvbox_invert_indent_guides = 1     -- Inverte os guias de recuo
      vim.g.gruvbox_invert_signs = 1             -- Inverte os sinais do GitGutter e Syntastic
      vim.g.gruvbox_invert_tabline = 1           -- Inverte a linha de abas


      -- Definindo fundo transparente
      vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Fundo transparente para a área normal
      vim.cmd("hi NonText guibg=NONE ctermbg=NONE") -- Fundo transparente para caracteres não visíveis
      vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")  -- Fundo transparente para números das linhas

      -- Destacar palavras-chave, funções e outras estruturas
      vim.cmd("hi Keyword guifg=#fe8019")  -- Altera a cor das palavras-chave para laranja
      vim.cmd("hi Function guifg=#8ec07c") -- Altera a cor das funções para verde claro
      -- Aplica o tema
      vim.cmd("colorscheme gruvbox")
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
      --      vim.cmd("hi Search guifg=none guibg=none")    -- Cor clara para o texto de Search
      --    vim.cmd("hi IncSearch guifg=none guibg=none") -- Cor clara para o texto de Search



      vim.cmd("hi Search guifg=#928374 guibg=#3c3836")    -- Cor suave de texto cinza claro para Search
      vim.cmd("hi IncSearch guifg=#d79921 guibg=#504945") -- Cor dourada para IncSearch

      --      require('gruvbox').load()
    end
  }
}





--
--
-- -- https://github.com/nanotech/jellybeans.vim
-- return {
--   'nanotech/jellybeans.vim',
--   priority = 1000,                 -- Tema será carregado primeiro antes de outros plugins
--   opts = {
--     transparent_background = true, -- Habilitar fundo transparente
--     palette = 'default',           -- Paleta de cores, pode ser 'default', 'light', etc.
--     cursor = 'block',              -- Estilo do cursor, pode ser 'block', 'underline'
--     underline = true,              -- Ativa o sublinhado para algumas partes da interface
--   },
--   config = function()
--     vim.cmd [[
--       colorscheme jellybeans
--     ]]
--
--     -- Configuração personalizada
--     vim.g.jellybeans_transparent_background = true -- Fundo transparente
--     vim.g.jellybeans_palette = 'default'           -- Paleta de cores
--     vim.g.jellybeans_cursor = 'block'              -- Estilo do cursor
--     vim.g.jellybeans_underline = 1                 -- Ativar sublinhado
--
--     -- require('jellybeans').load()
--   end,
--
-- }
--

--
-- -- https://github.com/comfysage/evergarden
-- return {
--   'comfysage/evergarden',
--   priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
--   opts = {
--     transparent_background = true,
--     variant = 'hard', -- 'hard'|'medium'|'soft'
--     overrides = { }, -- add custom overrides
--   },
--   config = function ()
--     require 'evergarden'.setup {
--       transparent_background = true,
--       variant = 'hard', -- 'hard'|'medium'|'soft'
--       override_terminal = true,
--       style = {
--         tabline = { 'reverse' },
--         search = { 'italic' },
--         incsearch = { 'reverse' },
--         types = { 'italic' },
--         keyword = { 'italic' },
--         comment = { 'italic' },
--         sign = { highlight = false },
--       },
--       integrations = {
--         blink_cmp = true,
--         cmp = true,
--         gitsigns = true,
--         indent_blankline = { enable = true, scope_color = 'green' },
--         nvimtree = true,
--         rainbow_delimiters = true,
--         symbols_outline = true,
--         telescope = true,
--         which_key = true,
--       },
--       overrides = { }, -- add custom overrides
--     }
--     require('evergarden').load()
--
--   end
--
-- }


-- return {
--   -- https://github.com/deparr/tairiki.nvim
--
--   'deparr/tairiki.nvim',
--   lazy = false,
--   priority = 1000, -- necessário apenas se você usar o tairiki como tema padrão
--   config = function()
--     require('tairiki').setup {
--       -- Opções principais --
--       style = 'dark', -- Estilo padrão do tema. Escolha entre 'dark', 'light' e 'dimmed'
--       transparent = false,  -- Mostrar/ocultar o fundo
--       term_colors = true, -- Mudar as cores do terminal conforme o estilo do tema selecionado
--       ending_tildes = false, -- Mostrar as tilde de fim de buffer. Por padrão, estão ocultas
--       cmp_itemkind_reverse = false, -- Inverter os destaques de tipo de item no menu do cmp
--       visual_bold = false, -- Deixar seleções visuais em negrito
--
--       -- Alternar estilo do tema ---
--       toggle_style_key = nil, -- Tecla de atalho para alternar o estilo do tema. Deixe como nil para desativar, ou defina como uma string, por exemplo "<leader>ts"
--       toggle_style_list = { 'dark' }, -- Estilos que a tecla de atalho `toggle_style_key` irá percorrer
--
--       -- Mudar estilo do código ---
--       -- As opções são italic, bold, underline, none
--       -- Você pode configurar múltiplos estilos separados por vírgula. Por exemplo, keywords = 'italic,bold'
--       code_style = {
--         comments = 'italic', -- Estilo de comentário
--         keywords = 'none', -- Estilo de palavras-chave
--         functions = 'none', -- Estilo de funções
--         strings = 'none', -- Estilo de strings
--         variables = 'none' -- Estilo de variáveis
--       },
--
--       -- Opções do Lualine --
--       lualine = {
--         transparent = false, -- Transparência da barra central do lualine
--       },
--
--       -- Destaques personalizados --
--       colors = {}, -- Substituir as cores padrão
--       highlights = {}, -- Substituir os grupos de destaque
--
--       -- Configuração dos Plugins --
--       diagnostics = {
--         darker = true, -- Cores mais escuras para diagnóstico
--         undercurl = true,   -- Usar undercurl em vez de sublinhado para diagnósticos
--         background = true,    -- Usar cor de fundo para texto virtual
--       },
--     }
--     require('tairiki').load() -- necessário para usar como tema padrão, se comporta como ':colorscheme tairiki'
--   end,
-- }



-- kanagawa
-- return {
--   'rebelot/kanagawa.nvim',
--   lazy = false,
--   priority = 999, --1000,
--   opts = {
--     transparent = true,
--     background = {
--       dark = "wave",
--     },
--     colors = {
--       palette = {
--         -- Cores de fundo (Base Eclipse)
--         sumiInk0 = "#2B2B2B",
--         sumiInk1 = "#323232",
--         sumiInk2 = "#3C3F41",
--         sumiInk3 = "#4E5254",
--         sumiInk4 = "#5A5D5F",
--         sumiInk5 = "#6A6D70",
--         sumiInk6 = "#808589",
--
--         -- Popups e Flutuantes
--         waveBlue1 = "#3C3F41",
--         waveBlue2 = "#4C5052",
--
--         -- Diff e Git
--         winterGreen = "#2B3328",
--         winterYellow = "#49443C",
--         winterRed = "#43242B",
--         winterBlue = "#252535",
--         autumnGreen = "#76A56A",
--         autumnRed = "#C34043",
--         autumnYellow = "#DCA561",
--
--         -- Diag
--         samuraiRed = "#FF6B68",
--         roninYellow = "#FFC66D",
--         waveAqua1 = "#6897BB",
--         dragonBlue = "#569CD6",
--
--         -- Primeiro plano e Comentários
--         oldWhite = "#A9B7C6",
--         fujiWhite = "#D4D4D4",
--         fujiGray = "#606366",
--         oniViolet = "#9876AA",
--         oniViolet2 = "#A082BD",
--         crystalBlue = "#569CD6",
--         springViolet1 = "#938AA9",
--         springViolet2 = "#9CABCA",
--         springBlue = "#7FC4EF",
--         waveAqua2 = "#77BBDD",
--
--         -- Outros destaques
--         springGreen = "#98BB6C",
--         boatYellow1 = "#938056",
--         boatYellow2 = "#C0A36E",
--         carpYellow = "#FFEE99",
--
--         sakuraPink = "#D27E99",
--         waveRed = "#E46876",
--         peachRed = "#FF5D62",
--         surimiOrange = "#FFAA44",
--         katanaGray = "#717C7C",
--       },
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts)
--     vim.cmd("colorscheme kanagawa")
--     -- deixar a cor do curso mais suave, na real, eu tireo ela... xD
--     vim.cmd([[ hi CursorLine guibg=#323232 guifg=NONE ]])
--     -- ativa o hailight para palavra ssemelhantes
--         vim.cmd([[
--       set hlsearch
--       set incsearch
--       augroup VimHighlight
--         autocmd!
--         autocmd CursorMoved * silent! call matchdelete(999)
--         autocmd CursorMoved * silent! call matchadd('Search', '\V\<'.expand('<cword>').'\>', 999, 999)
--       augroup END
--     ]])
--     -- deixa a barra das linahs co fundo transparenet tambem
--     vim.cmd([[
--       hi LineNr guibg=NONE
--       hi SignColumn guibg=NONE
--     ]])
--     -- Cores personalizadas para diffs
--     vim.cmd([[
--       autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
--       autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
--       autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
--       autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
--     ]])
--
--     -- Cores personalizadas para bordas
--     vim.cmd([[
--       autocmd ColorScheme * hi NormalFloat guibg=#3C3F41
--       autocmd ColorScheme * hi FloatBorder guifg=#D4D4D4 guibg=#3C3F41
--     ]])
--   end
-- }
--
