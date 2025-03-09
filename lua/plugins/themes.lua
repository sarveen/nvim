return {
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- load immediately
    priority = 1000,
  },

  -- Github theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },

  -- "Set default theme"
  {
    "nvim-lua/plenary.nvim", -- a dummy plugin so we can set a config
    lazy = false,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}

