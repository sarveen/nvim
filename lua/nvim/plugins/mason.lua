local function setup()
  -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        border = 'none',
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        'lua_ls',
        'tsserver',
        'pyright',
        'clangd',
        'gopls',
        'jdtls',
        'terraformls',
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- formatters
        'prettier',
        'stylua',
        'goimports',
        -- linters
        'eslint_d',
        'yamllint',
        'actionlint',
        'golangci-lint',
        'tflint',
      },
    })
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = setup
}
