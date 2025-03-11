return {
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  lazy = true,
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { 'nvim-lua/plenary.nvim' },
    {
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- Adiciona o neoclip para histórico de yank
    { 'AckslD/nvim-neoclip.lua' },
    -- { 'nvim-telescope/telescope-lsp-handlers.nvim' }, 
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75
        }
      },
      path_display = {
        filename_first = {
          reverse_directories = true
        }
      },
    },
    extensions = {
      neoclip = {}, -- Ativa o histórico de yank
      -- lsp_handlers = {},     -- deveria ativar os comandos do lsp no telescope...
    }
  },
  config = function()
    require('telescope').load_extension('neoclip') -- Carrega a extensão
    -- require('telescope').load_extension('lsp_handlers')  -- Carrega a extensão
  end
}

-- -- Fuzzy finder
-- return {
--   -- https://github.com/nvim-telescope/telescope.nvim
--   'nvim-telescope/telescope.nvim',
--   lazy = true,
--   dependencies = {
--     -- https://github.com/nvim-lua/plenary.nvim
--     { 'nvim-lua/plenary.nvim' },
--     {
--       -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
--       'nvim-telescope/telescope-fzf-native.nvim',
--       build = 'make',
--       cond = function()
--         return vim.fn.executable 'make' == 1
--       end,
--     },
--   },
--   opts = {
--     defaults = {
--       layout_config = {
--         vertical = {
--           width = 0.75
--         }
--       },
--       path_display = {
--         filename_first = {
--           reverse_directories = true
--         }
--       },
--     }
--   }
-- }
