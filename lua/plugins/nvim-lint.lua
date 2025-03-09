return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      yaml       = { "yamllint" },
      go     = { "golangcilint" },
      terraform  = { "tflint" },
    }
    
    local function get_git_root()
      local git_root = vim.fn.systemlist("git rev-parse --showtoplevel")[1]
      return vim.v.shell_error == 0 and git_root or nil
    end

    local function configure_golangci_lint()
      local golangci_lint = lint.linters.golangcilint
      if not golangci_lint then return end

      local config_file = get_git_root()
        and (get_git_root() .. "/.golangci.yml")

      if config_file and vim.fn.filereadable(config_file) == 1 then
        table.insert(golangci_lint.args, "--config=", config_file)
        table.insert(golangci_lint.args, "--new-from-rev=origin/main")
      end
    end

    configure_golangci_lint()

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

  end,
}
