-- Code Tree Support / Syntax Highlighting
return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
    ensure_installed = {
      'lua',
      'comment',
      'kotlin',
      'javascript',
      'typescript'

    },
    folding = {
      enable = true -- habilita abertura e fechamento de blocos de {}
      -- za(abre ou fecha), zR / zM (abre / fecha todos), manipula os do cursor zo / zc
    }
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end
}
