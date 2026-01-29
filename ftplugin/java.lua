local jdtls = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config = jdtls .. "/config_linux"
local plugins = vim.fn.glob(jdtls .. "/plugins/org.eclipse.equinox.launcher_*.jar", false, true)[1]
--local plugins = vim.fn.glob(jdtls .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

require("jdtls").start_or_attach({
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", plugins,
        "-configuration", config,
        "-data", workspace,
    },
    --root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
    root_dir = function()
        return vim.fs.dirname(vim.fs.find({".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}, {
            upward = true,
            type = "file"
        })[1])
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

--[[
local jdtls = require("jdtls")

local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

local mason_path = vim.fn.stdpath("data") .. "/mason"
local jdtls_path = mason_path .. "/packages/jdtls"
local config_path = jdtls_path .. "/config_linux"
local plugins_path = jdtls_path .. "/plugins/"
local jar = vim.fn.glob(plugins_path .. "org.eclipse.equinox.launcher_*.jar")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", jar,
    "-configuration", config_path,
    "-data", workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  capabilities = capabilities,
}

jdtls.start_or_attach(config)

-- Setup Java-specific keymaps
vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { desc = "Organize imports" })
vim.keymap.set("n", "<leader>ev", jdtls.extract_variable, { desc = "Extract variable" })
vim.keymap.set("v", "<leader>em", function() jdtls.extract_method(true) end, { desc = "Extract method" })
]]
