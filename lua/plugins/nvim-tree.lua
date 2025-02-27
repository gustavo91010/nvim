-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
  },
  config = function (_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)
  end
}

-- Comandos e atalhos úteis para o nvim-tree.lua:

-- Abre/fecha o explorador de arquivos
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Foca no explorador de arquivos
-- keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>")

-- Pesquisa por arquivos
-- keymap.set("n", "<leader>p", ":NvimTreeFindFile<CR>")

-- Navegação no explorador de arquivos:
-- j - Move para o arquivo ou diretório abaixo.
-- k - Move para o arquivo ou diretório acima.
-- h - Fecha o diretório.
-- l - Abre o diretório ou o arquivo.

-- Manipulação de arquivos:
-- a - Adiciona um novo arquivo ou diretório.
-- d - Deleta o arquivo ou diretório selecionado.
-- r - Renomeia o arquivo ou diretório selecionado.
-- x - Corta (move) o arquivo selecionado.
-- y - Copia o caminho do arquivo selecionado.
-- p - Cola o arquivo copiado ou cortado.

-- Fechar a árvore quando o arquivo for aberto:
-- o - Abre o arquivo no editor e fecha o explorador de arquivos, se configurado dessa forma.
