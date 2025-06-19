local jdtls = require('jdtls')

local config = {
  cmd = { "java", "-jar", "/home/gustavo/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher.jar" },
  root_dir = jdtls.setup.find_root({'.git', 'pom.xml', 'build.gradle'}),
}

jdtls.start_or_attach(config)

