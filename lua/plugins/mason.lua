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
  end,
}

