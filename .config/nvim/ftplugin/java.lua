local jdtls = require("jdtls")
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local jdtls_path = mason_packages .. "/jdtls"
local lombok_jar = jdtls_path .. "/lombok.jar"
local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local bundles = {
  vim.fn.glob(mason_packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
}
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_packages .. "/java-test/extension/server/*.jar"), "\n"))

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

jdtls.start_or_attach({
  name = "jdtls",
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. lombok_jar,
    "-data", vim.fn.expand("~/.cache/jdtls/workspace/") .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    launcher,
    "-configuration",
    jdtls_path .. "/config_linux",
  },
  root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
  settings = {
    java = {
      -- Enable code formatting
      format = {
        enabled = false,
      },
      -- Enable downloading archives from eclipse automatically
      eclipse = {
        downloadSource = true,
      },
      -- Enable downloading archives from maven automatically
      maven = {
        downloadSources = true,
      },
      -- Enable method signature help
      signatureHelp = {
        enabled = true,
      },
      -- Use the fernflower decompiler when using the javap command to decompile byte code back to java code
      contentProvider = {
        preferred = "fernflower",
      },
      -- Setup automatical package import oranization on file save
      saveActions = {
        organizeImports = true,
      },
      -- Customize completion options
      completion = {
        -- When using an unimported static method, how should the LSP rank possible places to import the static method from
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        -- Try not to suggest imports from these packages in the code action window
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
        -- Set the order in which the language server should organize imports
        importOrder = {
          "java",
          "jakarta",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        -- How many classes from a specific package should be imported before automatic imports combine them all into a single import
        organizeImports = {
          starThreshold = 9999,
          staticThreshold = 9999,
        },
      },
      -- How should different pieces of code be generated?
      codeGeneration = {
        -- When generating toString use a json format
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        -- When generating hashCode and equals methods use the java 7 objects method
        hashCodeEquals = {
          useJava7Objects = true,
        },
        -- When generating code use code blocks
        useBlocks = true,
      },
      -- If changes to the project will require the developer to update the projects configuration advise the developer before accepting the change
      configuration = {
        updateBuildConfiguration = "automatic",
      },
      -- enable code lens in the lsp
      referencesCodeLens = {
        enabled = true,
      },
      -- enable inlay hints for parameter names,
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
    },
  },
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities
  },
  capabilities = {
    workspace = {
      configuration = true
    },
    textDocument = {
      completion = {
        snippetSupport = false
      }
    }
  },
  on_attach = function()
    require('jdtls.dap').setup_dap()
    require('jdtls.dap').setup_dap_main_class_configs()
    require 'jdtls.setup'.add_commands()

    -- Vim-like shortcuts
    vim.keymap.set("n", "<leader>tm", "<Cmd> lua require('jdtls').test_nearest_method()<CR>",
      { desc = "➜ Test Method" })

    vim.keymap.set("v", "<leader>tm", "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>",
      { desc = "➜ Test Method" })

    vim.keymap.set("n", "<leader>tc", "<Esc><Cmd> lua require('jdtls').test_class()<CR>",
      { desc = "➜ Test Class" })

    -- IDE inherited shortcuts
    vim.keymap.set("n", "<C-M-o>", "<Cmd> lua require('jdtls').organize_imports()<CR>",
      { desc = "➜ Organize Imports" })

    vim.keymap.set("n", "<C-M-m>", "<Cmd> lua require('jdtls').extract_method()<CR>",
      { desc = "➜ Extract Method" })

    vim.keymap.set("v", "<C-M-m>", "<Esc><Cmd> lua require('jdtls').extract_method()<CR>",
      { desc = "➜ Extract Method" })

    vim.keymap.set("n", "<C-M-v>", "<Cmd> lua require('jdtls').extract_variable()<CR>",
      { desc = "➜ Extract Variable" })

    vim.keymap.set("v", "<C-M-v>", "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>",
      { desc = "➜ Extract Variable" })

    vim.keymap.set("n", "<C-M-c>", "<Cmd> lua require('jdtls').extract_constant()<CR>",
      { desc = "➜ Extract Constant" })

    vim.keymap.set("v", "<C-M-c>", "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>",
      { desc = "➜ Extract Constant" })
  end
})
