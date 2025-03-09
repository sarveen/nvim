local M = {}

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function M.setup()
  local plugins = {
    -- Treesitter
    require("plugins.treesitter"),

    -- Mason and related
    require("plugins.mason"),

    -- LSP
    require("plugins.lsp"),

    -- Completion
    require("plugins.blink"),

    -- Fuzzy finder/pickers
    require("plugins.snacks"),

    -- Formatter
    require("plugins.conform"),

    -- Linting
    require("plugins.nvim-lint"),

    -- Dressing
    require("plugins.dressing"),

    -- Which Key
    require("plugins.which-key"),

    -- Themes
    require("plugins.themes"),

    -- Lualine
    require("plugins.lualine"),

    -- Mini.nvim
    require("plugins.mini"),

    -- Comments
    require("plugins.comments"),

    -- Todo
    require("plugins.todo"),

    -- Gitsigns
    require("plugins.gitsigns"),

    -- Search and Replace
    require("plugins.grug-far"),

    -- DAP
    require("plugins.dap"),

    -- Neotest
    require("plugins.neotest"),

  }

  require("lazy").setup(plugins, {})
end

return M


