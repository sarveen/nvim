return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets"
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- Use the recommended API: get_lsp_capabilities()
    local blink_cmp = require("blink.cmp")
    local capabilities = blink_cmp.get_lsp_capabilities()

    -- Setup an on_attach callback with your typical LSP keymaps
    local on_attach = function(client, bufnr)
      local bufmap = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- LSP Actions
      bufmap("n", "<leader>lh", vim.lsp.buf.hover)       -- LSP Show Hover
      bufmap("n", "<leader>lr", vim.lsp.buf.rename)      -- LSP Rename Symbol
      bufmap("n", "<leader>la", vim.lsp.buf.code_action) -- LSP Code Action
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        }
      },
      underline = true,
      update_in_insert = false,
    })


    -- Example LSP servers (C/C++, Rust, Go).
    -- If you have more servers, just repeat with the same pattern.
    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--function-arg-placeholders",
        },
        init_options = {
          usePlaceholders = true,
          clangdFileStatus = true,
          inlayHints = {
            enabled = true,
          },
        },
      })
    })

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        gopls = {
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,

          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          semanticTokens = true,
        },
      },
    })

    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })



  end,
}

