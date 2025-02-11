local opt = vim.opt

-- Gerenciamento de Sessões
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Números das Linhas
opt.relativenumber = true
opt.number = true

-- Abas & Indentação
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Quebra de Linha
opt.wrap = false

-- Configurações de Busca
opt.ignorecase = true
opt.smartcase = true

-- Linha do Cursor
opt.cursorline = true

-- Aparência
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
vim.diagnostic.config {
  float = { border = "rounded" }, -- adicionar borda nos popups de diagnóstico
}

-- Backspace
opt.backspace = "indent,eol,start"

opt.clipboard = "unnamedplus"  -- Isso permite o acesso à área de transferência do sistema

-- Janelas divididas
opt.splitright = true
opt.splitbelow = true

-- Considerar '-' como parte da palavra-chave
opt.iskeyword:append("-")

-- Habilitar o mouse no nvim
opt.mouse = "a" -- " "
 
-- Dobramento de código
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utiliza o Treesitter para dobrar

-- Movimento das setas:
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-u>", { noremap = true, silent = true })

-- Mover uma linha ou bloco para baixo com Alt + Seta para baixo
vim.api.nvim_set_keymap("n", "<A-Down>", ":move .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-Down>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Mover uma linha ou bloco para cima com Alt + Seta para cima
vim.api.nvim_set_keymap("n", "<A-Up>", ":move .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-Up>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Duplicar uma linha ou bloco para baixo com Alt + Shift + Seta para baixo
vim.api.nvim_set_keymap("n", "<A-S-Down>", ":copy .<CR>==j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-S-Down>", ":copy '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Duplicar uma linha ou bloco para cima com Alt + Shift + Seta para cima
vim.api.nvim_set_keymap("n", "<A-S-Up>", ":copy .-1<CR>==k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-S-Up>", ":copy '<-2<CR>gv=gv", { noremap = true, silent = true })

