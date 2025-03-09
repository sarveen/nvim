return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "rust_analyzer",
        "gopls",
        "pyright",
        "lua_ls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        -- C/C++
        "clang-format",
        "cpplint",

        -- Rust
        -- "rustfmt", installed via rustup now

        -- Python
        "black",

        -- Go
        "gofumpt",
        "gci",

        -- Lua
        "luacheck",
      },
      auto_update = false,
      run_on_start = true,
    })

  require("mason-nvim-dap").setup({
    ensure_installed = {
      -- C/C++/Rust
      "cppdbg",

      -- Python
      "debugpy",

      -- Go
      "python",
    },
    auto_update = false,
  })
  end,
}

