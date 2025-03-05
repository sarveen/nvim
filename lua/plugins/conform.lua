-- ~/.config/nvim/lua/plugins/conform.lua
-- https://github.com/stevearc/conform.nvim

return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      -- Configure formatters/linters by filetype
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
        go = { "gofumpt", "golines" },
      },
      -- Optionally define format on save, etc.
      format_on_save = {
        timeout_ms = 1000, -- adjust as needed
      },
    })
  end,
}

