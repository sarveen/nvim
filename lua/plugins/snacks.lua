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
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Projects" },
    { "<leader>e", function() Snacks.explorer.open() end, desc = "Open File Explorer" },

    -- LSP Pickers
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "Goto References" },
    { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementations"},

    -- Diagnostics Picker
    { "<leader>od", function() Snacks.picker.diagnostics() end, desc = "View Diagnostics" },

    -- LazyGit
    { "<leader>ol", function() Snacks.lazygit.open() end, desc = "Open LazyGit"},

    -- Git

    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Current Line"},

    -- GitBrowse
    { "<leader>gB", function() Snacks.gitbrowse.open() end, desc = "Open Repository in Browser"},
    { "<leader>gU", function() Snacks.gitbrowse.get_url() end, desc = "Copy Repository URL"},
  }
}
