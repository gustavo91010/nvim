return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    background = {
      dark = "wave",
    },
    colors = {
      palette = {
        -- Cores de fundo (Base Eclipse)
        sumiInk0 = "#2B2B2B",
        sumiInk1 = "#323232",
        sumiInk2 = "#3C3F41",
        sumiInk3 = "#4E5254",
        sumiInk4 = "#5A5D5F",
        sumiInk5 = "#6A6D70",
        sumiInk6 = "#808589",

        -- Popups e Flutuantes
        waveBlue1 = "#3C3F41",
        waveBlue2 = "#4C5052",

        -- Diff e Git
        winterGreen = "#2B3328",
        winterYellow = "#49443C",
        winterRed = "#43242B",
        winterBlue = "#252535",
        autumnGreen = "#76A56A",
        autumnRed = "#C34043",
        autumnYellow = "#DCA561",

        -- Diag
        samuraiRed = "#FF6B68",
        roninYellow = "#FFC66D",
        waveAqua1 = "#6897BB",
        dragonBlue = "#569CD6",

        -- Primeiro plano e Comentários
        oldWhite = "#A9B7C6",
        fujiWhite = "#D4D4D4",
        fujiGray = "#606366",
        oniViolet = "#9876AA",
        oniViolet2 = "#A082BD",
        crystalBlue = "#569CD6",
        springViolet1 = "#938AA9",
        springViolet2 = "#9CABCA",
        springBlue = "#7FC4EF",
        waveAqua2 = "#77BBDD",

        -- Outros destaques
        springGreen = "#98BB6C",
        boatYellow1 = "#938056",
        boatYellow2 = "#C0A36E",
        carpYellow = "#FFEE99",

        sakuraPink = "#D27E99",
        waveRed = "#E46876",
        peachRed = "#FF5D62",
        surimiOrange = "#FFAA44",
        katanaGray = "#717C7C",
      },
    },
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd("colorscheme kanagawa")
    -- deixar a cor do curso mais suave, na real, eu tireo ela... xD
    vim.cmd([[ hi CursorLine guibg=#323232 guifg=NONE ]])
    -- ativa o hailight para palavra ssemelhantes
        vim.cmd([[
      set hlsearch
      set incsearch
      augroup VimHighlight
        autocmd!
        autocmd CursorMoved * silent! call matchdelete(999)
        autocmd CursorMoved * silent! call matchadd('Search', '\V\<'.expand('<cword>').'\>', 999, 999)
      augroup END
    ]])
    -- deixa a barra das linahs co fundo transparenet tambem
    vim.cmd([[
      hi LineNr guibg=NONE
      hi SignColumn guibg=NONE
    ]])
    -- Cores personalizadas para diffs
    vim.cmd([[
      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
    ]])

    -- Cores personalizadas para bordas
    vim.cmd([[
      autocmd ColorScheme * hi NormalFloat guibg=#3C3F41
      autocmd ColorScheme * hi FloatBorder guifg=#D4D4D4 guibg=#3C3F41
    ]])
  end
}

