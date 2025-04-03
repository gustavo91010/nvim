-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     -- priority = 1000,

--     config = function()
--       -- Opções padrão
--       require('nightfox').setup({
--         options = {
--           -- Localização do arquivo compilado
--           compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--           compile_file_suffix = "_compiled", -- Sufixo do arquivo compilado
--           transparent = true,                -- Desativa a configuração do plano de fundo
--           terminal_colors = true,            -- Define cores do terminal (vim.g.terminal_color_*) usadas no `:terminal`
--           dim_inactive = false,              -- Painéis não focados usam um fundo alternativo
--           module_default = true,             -- Valor padrão de ativação para módulos
--           colorblind = {
--             enable = false,                  -- Ativa suporte para daltonismo
--             simulate_only = true,            -- Apenas simula as cores para daltonismo, sem alterar a paleta original
--             severity = {
--               protan = 0,                    -- Intensidade [0,1] para protanopia (vermelho)
--               deutan = 0,                    -- Intensidade [0,1] para deuteranopia (verde)
--               tritan = 0,                    -- Intensidade [0,1] para tritanopia (azul)
--             },
--           },
--           styles = {           -- Estilos aplicados a diferentes grupos de sintaxe
--             comments = "NONE", -- Qualquer valor válido de `:help attr-list`
--             conditionals = "NONE",
--             constants = "NONE",
--             functions = "NONE",
--             keywords = "NONE",
--             numbers = "NONE",
--             operators = "NONE",
--             strings = "NONE",
--             types = "NONE",
--             variables = "NONE",
--           },
--           inverse = {            -- Destaca inversamente diferentes tipos
--             match_paren = false, -- Parênteses correspondentes
--             visual = false,      -- Seleção visual
--             search = false,      -- Pesquisa
--           },
--           modules = {            -- Lista de vários plugins e opções adicionais
--             -- ...
--           },
--         },
--         palettes = {
--           nightfox = {
--             black   = "#0d0d0d", -- Fundo mais escuro
--             red     = "#652525", -- "#ff5f5f", -- Vermelho vibrante
--             green   = "#7fff7f", -- "#dfffdf",  -- "#c8ffc8", -- "#5fff5f", -- Verde mais brilhante
--             yellow  = "#ffff5f", -- Amarelo mais chamativo
--             blue    = "#5fafff", -- Azul mais destacado
--             magenta = "#652565", -- "#af5fff", -- Magenta intenso
--             cyan    = "#256565", -- #5fffff", -- Ciano mais forte
--             white   = "#e5e5e5", -- Texto claro
--           }
--         },                       -- Personalização de paletas de cores
--         specs = {
--           nightfox = {
--             syntax = {
--               keyword  = "magenta.bright", -- Deixa palavras-chave mais destacadas
--               builtin  = "red.bright",     -- Funções embutidas com mais contraste
--               variable = "white",          -- Variáveis mais visíveis
--             },
--             diag = {
--               error = "red.bright",
--               warn  = "yellow.bright",
--               info  = "blue.bright",
--               hint  = "cyan.bright",
--             },
--           },
--         },           -- Especificações de cores personalizadas
--         groups = {}, -- Grupos de destaque personalizados
--       })

--       -- A configuração deve ser chamada antes de carregar o tema
--       vim.cmd("colorscheme nightfox")
--       -- vim.cmd("colorscheme nordfox") -- Alternativa: dayfox, dawnfox, duskfox, terafox
--     end
--   }
-- }
-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--       require("gruvbox").setup({
--         terminal_colors = true, -- Adiciona cores ao terminal do Neovim
--         undercurl = true,
--         underline = true,
--         bold = true,
--         italic = {
--           strings = true,
--           emphasis = true,
--           comments = true,
--           operators = false,
--           folds = true,
--         },
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true, -- Inverte fundo para buscas, diffs, statuslines e erros
--         contrast = "hard", -- "hard", "soft" ou vazio
--         palette_overrides = {},
--         overrides = {
--                   SignColumn = { bg = "#a89984" }
--         },
--         dim_inactive = false,
--         transparent_mode =true,
--       })
--       vim.o.background = "dark" -- dark" -- Ou "light"
--       vim.cmd("colorscheme gruvbox")
--     end
--   }
-- }



-- return {
--   'folke/tokyonight.nvim',
--   priority = 1000,
--   opts = {
--     style = 'night', -- Opções: 'storm', 'night', 'moon', 'day'
--     transparent = true,
--     terminal_colors = true,
--     styles = {
--       comments = { italic = true },
--       keywords = { italic = true },
--       functions = {},
--       variables = {},
--       sidebars = 'dark',
--       floats = 'dark',
--     },
--   },
--   config = function()
--     -- Configuração do tema
--     require('tokyonight').setup({
--       style = "night",
--       transparent = true,  -- Garantir que o fundo do Neovim seja transparente
--     })

--     -- Aplicando o esquema de cores
--     vim.cmd[[colorscheme tokyonight-night]]

--     -- Personalizando as cores do NvimTree (garantindo fundo transparente)
--     local hl = vim.api.nvim_set_hl
--     local c = vim.g.colors_name and vim.g.colors_name or {}
--     hl(0, "NvimTreeNormal", { fg = c.fg, bg = "NONE" })
--     hl(0, "NvimTreeVertSplit", { fg = c.fg, bg = "NONE" })
--     hl(0, "NvimTreeStatusline", { fg = c.fg, bg = "NONE" })

--     -- Garantir transparência no fundo das janelas flutuantes
--     hl(0, "NormalFloat", { fg = c.fg, bg = "NONE" })
--     hl(0, "FloatBorder", { fg = c.fg, bg = "NONE" })

--     -- Garantir que o fundo do NvimTree seja transparente
--     vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
--     vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "NONE" })
--   end
-- }












--
--

-- return {
--   'comfysage/evergarden',
--   priority = 1000,                 -- Prioridade alta para carregar o esquema de cores antes de outros plugins
--   opts = {
--     transparent_background = true, -- Define o fundo transparente
--     variant = 'soft',              -- Variante do tema: 'hard', 'medium' ou 'soft'
--     overrides = { },                -- Sobrescritas personalizadas (vazio por enquanto)
--   },
--   config = function()
--     require 'evergarden'.setup {
--       theme = { "evergarden" },
--       editor = { },
--       transparent_background = true,
--       variant = 'hard', -- 'hard',
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
--       overrides = {
--         Normal = {
--           -- '#fddce3',
--           -- '#000000',
--           -- fg = '#000000',     -- Define a cor do texto para normal
--           style = { 'bold', 'italic' }
--         },

--         Comment = {
--           fg = '#888888', -- Cor de comentário mais brilhante
--           style = { 'italic' }
--         },
--         Keyword = {
--           fg = '#ff0000', -- Cor de palavras-chave mais vibrante
--           style = { 'italic' }
--         },
--       },
--     }

--     require('evergarden').load() -- Carrega o tema com as configurações definidas
--   end
-- }


-- -- sera que vai emular o eclipse mesmo???

return {
  'deparr/tairiki.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tairiki').setup {
      style = 'dark',
      transparent = false, -- Fundo transparente
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
      visual_bold = false,

      toggle_style_key = nil,
      toggle_style_list = { 'dark' },

      code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },

      lualine = {
        transparent = true,
      },

      colors = {
        bg = "#000000",   -- Fundo preto
        -- bg = "NONE",         -- Fundo transparente
        --       bg = "#99CC99",         -- Fundo transparente
        -- fg = "#C0C0C0",      -- Texto principal (cinza claro)
        -- red = "#FF6666",     -- Erros e alertas (vermelho Eclipse)
        -- green = "#99CC99",   -- Código válido (verde Eclipse)
        -- yellow = "#FFFF99",  -- Strings (amarelo Eclipse)
        -- blue = "#6699CC",    -- Nomes de funções e classes (azul Eclipse)
        -- magenta = "#CC99CC", -- Palavras-chave (roxo Eclipse)
        -- cyan = "#66CCCC",    -- Variáveis (ciano Eclipse)
        -- orange = "#FF9966",  -- Atributos e números (laranja Eclipse)
      },

      highlights = {
        -- Normal   = { fg = "#C0C0C0", bg = "NONE" },
        Normal   = { fg = "#C0C0C0", bg = "#000000" },
        Comment  = { fg = "#999999", italic = true },
        Keyword  = { fg = "#CC99CC", bold = true },
        Function = { fg = "#6699CC", bold = true },
        String   = { fg = "#FFFF99", bold = true },
        Variable = { fg = "#66CCCC", bold = true },
        Number   = { fg = "#FF9966", bold = true },
        Type     = { fg = "#99CC99", bold = true },
      },

      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    }
    require('tairiki').load()
  end,
}








-- return {
--   -- https://github.com/deparr/tairiki.nvim

--   'deparr/tairiki.nvim',
--   lazy = false,
--   priority = 1000, -- necessário apenas se você usar o tairiki como tema padrão
--   config = function()
--     require('tairiki').setup {
--       -- Opções principais --
--       style = 'dark',               -- Estilo padrão do tema. Escolha entre 'dark', 'light' e 'dimmed'
--       transparent = false,          --true,  -- Mostrar/ocultar o fundo
--       term_colors = true,           -- Mudar as cores do terminal conforme o estilo do tema selecionado
--       ending_tildes = false,        -- Mostrar as tilde de fim de buffer. Por padrão, estão ocultas
--       cmp_itemkind_reverse = false, -- Inverter os destaques de tipo de item no menu do cmp
--       visual_bold = false,          -- Deixar seleções visuais em negrito

--       -- Alternar estilo do tema ---
--       toggle_style_key = nil,         -- Tecla de atalho para alternar o estilo do tema. Deixe como nil para desativar, ou defina como uma string, por exemplo "<leader>ts"
--       toggle_style_list = { 'dark' }, -- Estilos que a tecla de atalho `toggle_style_key` irá percorrer

--       -- Mudar estilo do código ---
--       -- As opções são italic, bold, underline, none
--       -- Você pode configurar múltiplos estilos separados por vírgula. Por exemplo, keywords = 'italic,bold'
--       code_style = {
--         comments = 'italic', -- Estilo de comentário
--         keywords = 'none',   -- Estilo de palavras-chave
--         functions = 'none',  -- Estilo de funções
--         strings = 'none',    -- Estilo de strings
--         variables = 'none'   -- Estilo de variáveis
--       },

--       -- Opções do Lualine --
--       lualine = {
--         transparent = true, --false, -- Transparência da barra central do lualine
--       },

--       -- Destaques personalizados --
--       colors = {
--         bg = "#000000",   -- Fundo preto para máximo contraste
--         red = "#ff5555",
--         green = "#50fa7b",
--         yellow = "#f1fa8c",
--         blue = "#bd93f9",
--         magenta = "#ff79c6",
--         cyan = "#8be9fd",
--         orange = "#ffb86c",
--       },               -- Substituir as cores padrão
--       highlights = {}, -- Substituir os grupos de destaque

--       -- Configuração dos Plugins --
--       diagnostics = {
--         darker = true,     -- Cores mais escuras para diagnóstico
--         undercurl = true,  -- Usar undercurl em vez de sublinhado para diagnósticos
--         background = true, -- Usar cor de fundo para texto virtual
--       },
--     }
--     require('tairiki').load() -- necessário para usar como tema padrão, se comporta como ':colorscheme tairiki'
--   end,
-- }

-- -- kanagawa
-- return {
--   'rebelot/kanagawa.nvim',
--   lazy = false,
--   priority = 999, --1000,
--   opts = {
--     transparent = true,
--     background = {
--       dark = "dragon", -- wave, dragon, lotus
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

--         -- Popups e Flutuantes
--         waveBlue1 = "#3C3F41",
--         waveBlue2 = "#4C5052",

--         -- Diff e Git
--         winterGreen = "#2B3328",
--         winterYellow = "#49443C",
--         winterRed = "#43242B",
--         winterBlue = "#252535",
--         autumnGreen = "#76A56A",
--         autumnRed = "#C34043",
--         autumnYellow = "#DCA561",

--         -- Diag
--         samuraiRed = "#FF6B68",
--         roninYellow = "#FFC66D",
--         waveAqua1 = "#6897BB",
--         dragonBlue = "#569CD6",

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

--         -- Outros destaques
--         springGreen = "#98BB6C",
--         boatYellow1 = "#938056",
--         boatYellow2 = "#C0A36E",
--         carpYellow = "#FFEE99",

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

--     -- Cores personalizadas para bordas
--     vim.cmd([[
--       autocmd ColorScheme * hi NormalFloat guibg=#3C3F41
--       autocmd ColorScheme * hi FloatBorder guifg=#D4D4D4 guibg=#3C3F41
--     ]])
--   end

-- }
