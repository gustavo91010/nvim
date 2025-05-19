return {
  -- Configuração LSP
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- Gerenciamento LSP
    { 'williamboman/mason.nvim',                  config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Auto-instalação de LSPs, linters, formatadores, depuradores
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    -- Atualizações úteis de status para LSP
    { 'j-hui/fidget.nvim',                        opts = {} },
    -- Configuração adicional do lua, torna as coisas no nvim incríveis!
    { 'folke/neodev.nvim',                        opts = {} },
  },
  config = function()
    -- Configurar o Mason
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls', 'cssls', 'html', 'gradle_ls', 'groovyls', 'lua_ls',
        'jdtls', 'jsonls', 'kotlin_language_server', 'lemminx', 'marksman',
        'quick_lint_js', 'yamlls', 'ts_ls', 'tailwindcss', 'eslint'
      }
    })

    -- Configurar o Mason Tool Installer
    require('mason-tool-installer').setup({
      ensure_installed = { 'java-debug-adapter', 'java-test', 'ktlint' },
    })

    -- Chamar a instalação do Mason Tools manualmente
    vim.api.nvim_command('MasonToolsInstall')

    -- Definir variáveis de configuração LSP
    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Defina os bindings de teclas aqui...
    end

    -- Configuração dos servidores LSP
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        -- Configuração específica para cada servidor LSP
        if server_name == 'jdtls' then
          -- Java tem uma configuração separada
          -- O código específico para o JDTLS pode ir aqui, se necessário
        elseif server_name == 'ts_ls' then
          lspconfig.ts_ls.setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        elseif server_name == 'tailwindcss' then
          lspconfig.tailwindcss.setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        elseif server_name == 'eslint' then
          lspconfig.eslint.setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        else
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end
    })

    -- Desativar Semantic Tokens para evitar mudanças inesperadas de cor, especialmente no Java
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.semanticTokensProvider then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end
    })

    -- Configurações específicas para o LSP Lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }, -- Reconhecer o global `vim`
          },
        },
      },
    }

    -- Configuração do LSP Kotlin
    lspconfig.kotlin_language_server.setup {
      filetypes = { "kotlin", "kt", "kts" },
      cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/kotlin-language-server/server/bin/kotlin-language-server" },
      -- Colocando essa função aqui, para garantir que o plugin null-ls tenha proioridade na formatação do kotlin
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
    }

    -- Configurar globalmente os popups flutuantes de LSP
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Definir borda arredondada
      return open_floating_preview(contents, syntax, opts, ...)
    end

    -- -- ... (todo o conteúdo anterior permanece igual até o final da config)

    --     -- Configuração null-ls com ktlint
    --     local null_ls = require("null-ls")
    --     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    --     null_ls.setup({
    --       sources = {
    --         null_ls.builtins.formatting.ktlint,
    --         null_ls.builtins.diagnostics.ktlint,
    --       },
    --       on_attach = function(client, bufnr)
    --         if client.supports_method("textDocument/formatting") then
    --           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --           vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --               vim.lsp.buf.format({ bufnr = bufnr })
    --             end,
    --           })
    --         end
    --       end,
    --     })
  end
}
