---@type NvPluginSpec
-- NOTE: For Java
return {
  "nvim-java/nvim-java",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  ft = { "java" },
  config = function()
    require("java").setup()
    
    local opts = require("plugins.lsp.opts")
    
    vim.lsp.config.jdtls = {
      cmd = { vim.fn.exepath("jdtls") },
      root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}),
      filetypes = { "java" },
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
    }
    
    vim.lsp.enable("jdtls")
  end,
}