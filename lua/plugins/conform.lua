return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      -- Configure formatters/linters by filetype
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
        go = { "gofumpt", "gofmt", "gci", "goimports" },
      },
      formatters = {
        go = {
          run_all_formatters = true,
        },
        goimports = {
          prepend_args = { "-local", "github.com/sarveen" }
        },
      },
      -- Optionally define format on save, etc.
      format_after_save = {
        timeout_ms = 1000,
      },
    })
  end,
}
