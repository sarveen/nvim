return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
  keys = {
    -- File Pickers
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fs", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Find LSP Symbols" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find Recent Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Projects" },
  }
}
