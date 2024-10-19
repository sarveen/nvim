return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = { enable = true },
      indent = {
        enable = true,
      } ,
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "dockerfile",
        "gitignore",
        "c",
        "cpp",
        "go",
        "python",
        "java",
        "terraform",
      },
    })
  end,
}
