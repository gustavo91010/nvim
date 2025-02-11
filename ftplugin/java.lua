-- Configuração do JDTLS (LSP Java)
local home = vim.env.HOME -- Obtém o diretório home

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t") -- Obtém o nome do projeto
local workspace_dir = home .. "/jdtls-workspace/" .. project_name -- Diretório de trabalho do JDTLS

local system_os = ""

-- Determina o sistema operacional
if vim.fn.has("mac") == 1 then
  system_os = "mac"
elseif vim.fn.has("unix") == 1 then
  system_os = "linux"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  system_os = "win"
else
  print("Sistema operacional não encontrado, configurando como 'linux'") -- Caso não seja detectado
  system_os = "linux"
end

-- Necessário para depuração
local bundles = {
  vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Necessário para rodar/depurar testes unitários
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

-- Consulte `:help vim.lsp.start_client` para obter uma visão geral das opções `config` suportadas.
local config = {
  -- O comando que inicia o servidor de linguagem
  -- Veja: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar", -- Usando Lombok
    "-Xmx4g", -- Aloca 4GB de memória
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED", -- Permissões de módulos
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    -- Localização do Eclipse jdtls
    "-jar",
    home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
    "-data",
    workspace_dir, -- Diretório de dados do projeto
  },

  -- Este é o padrão se não fornecido, pode ser removido ou ajustado conforme necessário.
  -- Um servidor e cliente LSP dedicados serão iniciados por diretório root único
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

  -- Aqui você pode configurar as opções específicas do eclipse.jdt.ls
  -- Consulte https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      -- TODO Substitua isso pelo caminho absoluto da sua versão principal do Java (JDK 17 ou superior)
      home = "/usr/lib/jvm/java-17-openjdk-amd64",
      eclipse = {
        downloadSources = true, -- Baixar fontes
      },
      configuration = {
        updateBuildConfiguration = "interactive", -- Configuração interativa
        -- TODO Atualize isso adicionando quaisquer runtimes necessários para suportar seus projetos Java
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk-amd64",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk-amd64",
          },
          {
            name = "JavaSE-8",
            path = "/usr/lib/jvm/java-8-openjdk-amd64",
          },
        },
      },
      maven = {
        downloadSources = true, -- Baixar fontes do Maven
      },
      implementationsCodeLens = {
        enabled = true, -- Ativa a sugestão de implementações
      },
      referencesCodeLens = {
        enabled = true, -- Ativa a sugestão de referências
      },
      references = {
        includeDecompiledSources = true, -- Incluir fontes decompiladas
      },
      signatureHelp = { enabled = true }, -- Habilita ajuda de assinatura de métodos
      format = {
        enabled = true, -- Habilita formatação automática
        -- Formatação funciona por padrão, mas você pode referenciar um arquivo/URL específico se desejar
        -- settings = {
        --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
        --   profile = "GoogleStyle",
        -- },
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat", -- Adiciona métodos favoritos para autocompletar
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999, -- Organiza imports, se houver mais de 9999 imports
          staticStarThreshold = 9999, -- Organiza imports estáticos
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}", -- Template para gerar método toString
        },
        useBlocks = true, -- Usa blocos para código gerado
      },
    },
  },

  -- Necessário para autocompletar com assinaturas de métodos e espaços reservados
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  flags = {
    allow_incremental_sync = true, -- Permite sincronização incremental
  },
  init_options = {
    -- Referencia os bundles definidos acima para suportar Depuração e Testes Unitários
    bundles = bundles,
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
}

-- Necessário para depuração
config["on_attach"] = function(client, bufnr)
  jdtls.setup_dap({ hotcodereplace = "auto" }) -- Habilita substituição de código durante a execução
  require("jdtls.dap").setup_dap_main_class_configs() -- Configura as classes principais para depuração
end

-- Inicia um novo cliente e servidor, ou se conecta a um cliente e servidor existentes com base no `root_dir`.
jdtls.start_or_attach(config)

