-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
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

      bufmap("n", "gd", vim.lsp.buf.definition)
      bufmap("n", "<leader>K", vim.lsp.buf.hover)
      bufmap("n", "gr", vim.lsp.buf.references)
      bufmap("n", "<leader>rn", vim.lsp.buf.rename)
      bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
    end

    -- Signs
    vim.diagnostic.config({
      virtual_text = {
        prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
    })


    -- Example LSP servers (C/C++, Rust, Go).
    -- If you have more servers, just repeat with the same pattern.
    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}

