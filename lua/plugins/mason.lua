-- ~/.config/nvim/lua/plugins/mason.lua

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- This ensures these servers are always installed
      ensure_installed = {
        "rust_analyzer",
        "gopls",
        "clangd",
      },
    })

    require("mason-tool-installer").setup({
      -- Tools you want to ensure are installed for format/lint
      ensure_installed = {
        -- C/C++
        "clang-format",
        "cpplint",

        -- Rust
        -- "rustfmt", installed via rustup now

        -- Go
        "gofumpt",
        "golines",
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}

