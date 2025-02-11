-- Definir a tecla líder para espaço
vim.g.mapleader = " "

local keymap = vim.keymap
local builtin = require('telescope.builtin')

-- Mapeamentos gerais
keymap.set("n", "<leader>wq", ":wq<CR>") -- salvar e sair
keymap.set("n", "<leader>qq", ":q!<CR>") -- sair sem salvar
keymap.set("n", "<leader>ww", ":w<CR>") -- salvar
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- abrir URL sob o cursor

-- Gerenciamento de janelas divididas
keymap.set("n", "<leader>sv", "<C-w>v") -- dividir janela verticalmente
keymap.set("n", "<leader>sh", "<C-w>s") -- dividir janela horizontalmente
keymap.set("n", "<leader>se", "<C-w>=") -- igualar largura das janelas divididas
keymap.set("n", "<leader>sx", ":close<CR>") -- fechar janela dividida
keymap.set("n", "<leader>sj", "<C-w>-") -- diminuir altura da janela dividida
keymap.set("n", "<leader>sk", "<C-w>+") -- aumentar altura das janelas divididas
keymap.set("n", "<leader>sl", "<C-w>>5") -- aumentar largura das janelas divididas
keymap.set("n", "<leader>sw", "<C-w><5") -- diminuir largura das janelas divididas

-- Gerenciamento de abas
keymap.set("n", "<leader>to", ":tabnew<CR>") -- abrir uma nova aba
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- fechar uma aba
keymap.set("n", "<leader>tn", ":tabn<CR>") -- próxima aba
keymap.set("n", "<leader>tp", ":tabp<CR>") -- aba anterior

-- Mapeamentos para diff
keymap.set("n", "<leader>cc", ":diffput<CR>") -- colocar diff de atual para outro durante diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- pegar diff da esquerda (local) durante merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- pegar diff da direita (remoto) durante merge
keymap.set("n", "<leader>cn", "]c") -- próximo hunk de diff
keymap.set("n", "<leader>cp", "[c") -- hunk de diff anterior

-- Mapeamentos de quickfix
keymap.set("n", "<leader>qo", ":copen<CR>") -- abrir lista quickfix
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- ir para o primeiro item da lista quickfix
keymap.set("n", "<leader>qn", ":cnext<CR>") -- ir para o próximo item da lista quickfix
keymap.set("n", "<leader>qp", ":cprev<CR>") -- ir para o item anterior da lista quickfix
keymap.set("n", "<leader>ql", ":clast<CR>") -- ir para o último item da lista quickfix
keymap.set("n", "<leader>qc", ":cclose<CR>") -- fechar lista quickfix

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- alternar maximizar aba

-- Nvim-tree
keymap.set("n", "<C-q>", ":NvimTreeToggle<CR>") -- alternar explorador de arquivos
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- alternar foco para explorador de arquivos
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- encontrar arquivo no explorador de arquivos

-- Telescope
keymap.set("n", "<C-p>", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})

keymap.set('n', '<leader>fb', builtin.buffers, {}) -- busca fuzzy por buffers abertos
keymap.set('n', '<leader>fh', builtin.help_tags, {}) -- busca fuzzy por tags de ajuda
keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {}) -- busca fuzzy no buffer do arquivo atual
keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {}) -- busca fuzzy por símbolos LSP/classe
keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {}) -- busca fuzzy por chamadas LSP/entrada
keymap.set('n', '<leader>fm', function() builtin.treesitter({symbols={'function', 'method'}}) end) -- busca fuzzy por métodos na classe atual
keymap.set('n', '<leader>ft', function() -- buscar conteúdo no arquivo no nó atual do nvim-tree
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  builtin.live_grep({search_dirs = {node.absolute_path}})
end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- alternar git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Executar consulta REST

-- LSP
keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Mapeamentos específicos de tipo de arquivo (podem ser feitos no diretório ftplugin se preferir)
keymap.set("n", '<leader>go', function()
  if vim.bo.filetype == "java" then
    require("jdtls").organize_imports()
  end
end)

