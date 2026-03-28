local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local home = os.getenv "HOME"
local mason_packages_path = vim.fn.stdpath "data" .. "/mason/packages"

local function get_launcher(mason_path)
  return vim.fn.glob(mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
end

local function get_config(mason_path)
  return mason_path .. "/jdtls/config_linux"
end

local function get_lombok(mason_path)
  return mason_path .. "/jdtls/lombok.jar"
end

local function get_bundles(mason_path)
  local debug_adapter =
    vim.fn.glob(mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true, true)
  local test_jars = vim.fn.glob(mason_path .. "/java-test/extension/server/*.jar", true, true)

  local bundles = debug_adapter or {}

  if test_jars then
    -- https://github.com/mfussenegger/nvim-jdtls/issues/746
    local excluded = {
      "com.microsoft.java.test.runner-jar-with-dependencies.jar",
      "jacocoagent.jar",
    }

    for _, jar in ipairs(test_jars) do
      local fname = vim.fn.fnamemodify(jar, ":t")
      if not vim.tbl_contains(excluded, fname) then
        table.insert(bundles, jar)
      end
    end
  end

  return bundles
end

local function get_extended_client_capabilities(jdt_ls)
  local extendedClientCapabilities = jdt_ls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  return extendedClientCapabilities
end

local function get_workspace(home_path)
  local cache_dir = vim.fn.expand(home_path .. "/.cache/jdtls/workspace/")
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  return cache_dir .. project_name
end

local function get_runtimes(home_path)
  return {
    {
      name = "JavaSE-11",
      path = home_path .. "/.jdk/jdk-11.0.2/",
    },
    {
      name = "JavaSE-17",
      path = home_path .. "/.jdk/jdk-17.0.2/",
    },
    {
      name = "JavaSE-21",
      path = home_path .. "/.jdk/jdk-21.0.2/",
      default = true,
    },
    {
      name = "JavaSE-25",
      path = home_path .. "/.jdk/jdk-25.0.1/",
    },
  }
end

jdtls.start_or_attach {
  name = "jdtls",
  cmd = {
    "/home/guistella/.jdk/jdk-21.0.2/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. get_lombok(mason_packages_path),
    "-jar",
    get_launcher(mason_packages_path),
    "-configuration",
    get_config(mason_packages_path),
    "-data",
    get_workspace(home),
  },
  root_dir = jdtls.setup.find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
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
        runtimes = get_runtimes(home),
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
    bundles = get_bundles(mason_packages_path),
    extendedClientCapabilities = get_extended_client_capabilities(jdtls),
  },
  capabilities = {
    workspace = {
      configuration = true,
    },
    textDocument = {
      completion = {
        snippetSupport = false,
      },
    },
  },
  on_attach = function()
    require("jdtls.dap").setup_dap()
    require("jdtls.dap").setup_dap_main_class_configs()

    -- Vim-like shortcuts
    vim.keymap.set(
      "n",
      "<leader>tm",
      "<Cmd> lua require('jdtls').test_nearest_method()<CR>",
      { desc = "➜ Test Method" }
    )

    vim.keymap.set(
      "v",
      "<leader>tm",
      "<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>",
      { desc = "➜ Test Method" }
    )

    vim.keymap.set("n", "<leader>tc", "<Esc><Cmd> lua require('jdtls').test_class()<CR>", { desc = "➜ Test Class" })

    -- IDE inherited shortcuts
    vim.keymap.set(
      "n",
      "<C-M-o>",
      "<Cmd> lua require('jdtls').organize_imports()<CR>",
      { desc = "➜ Organize Imports" }
    )

    vim.keymap.set("n", "<C-M-m>", "<Cmd> lua require('jdtls').extract_method()<CR>", { desc = "➜ Extract Method" })

    vim.keymap.set(
      "v",
      "<C-M-m>",
      "<Esc><Cmd> lua require('jdtls').extract_method()<CR>",
      { desc = "➜ Extract Method" }
    )

    vim.keymap.set(
      "n",
      "<C-M-v>",
      "<Cmd> lua require('jdtls').extract_variable()<CR>",
      { desc = "➜ Extract Variable" }
    )

    vim.keymap.set(
      "v",
      "<C-M-v>",
      "<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>",
      { desc = "➜ Extract Variable" }
    )

    vim.keymap.set(
      "n",
      "<C-M-c>",
      "<Cmd> lua require('jdtls').extract_constant()<CR>",
      { desc = "➜ Extract Constant" }
    )

    vim.keymap.set(
      "v",
      "<C-M-c>",
      "<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>",
      { desc = "➜ Extract Constant" }
    )
  end,
}
