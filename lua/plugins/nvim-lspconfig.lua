-- Suporte LSP
return {
  -- Configuração LSP
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- Gerenciamento LSP
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Auto-instalação de LSPs, linters, formatadores, depuradores
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- Atualizações úteis de status para LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Configuração adicional do lua, torna as coisas no nvim incríveis!
    -- https://github.com/folke/neodev.nvim
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Instalar esses LSPs automaticamente
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'gradle_ls',
        'groovyls',
        'lua_ls',
        'jdtls',
        'jsonls',
        'lemminx',
        'marksman',
        'quick_lint_js',
        'yamlls',
      }
    })

    require('mason-tool-installer').setup({
      -- Instalar esses linters, formatadores, depuradores automaticamente
      ensure_installed = {
        'java-debug-adapter',
        'java-test',
      },
    })

    -- Há um problema com o mason-tools-installer rodando com VeryLazy, pois ele é acionado no VimEnter, o que ocorre antes deste plugin ser carregado, então precisamos chamar a instalação explicitamente
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command('MasonToolsInstall')

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Crie seus bindings de teclas aqui...
    end

    -- Chamar a configuração para cada servidor LSP
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        -- Não chame a configuração para o JDTLS (LSP Java) porque ele será configurado em uma configuração separada
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end
    })

    -- Configurações do LSP Lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Fazer com que o servidor de linguagem reconheça o global `vim`
            globals = {'vim'},
          },
        },
      },
    }
    -- Configuraão do LSP Kotlin
    local lsp = require('lspconfig')
    lsp.kotlin_language_server.setup{
      filetypes = { "kotlin" , "kt", "kts"},
      -- If you don't update you $PATH
      cmd = { os.getenv( "HOME" ) .. "/language_servers/build/install/bin/kotlin_language_server" },
    }


    -- Configurar globalmente todos os popups flutuantes de LSP (como hover, ajuda de assinatura, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Definir a borda como arredondada
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end
}

