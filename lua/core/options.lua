local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Other common options
opt.mouse = "a"            -- enable mouse
opt.termguicolors = true   -- enable 24-bit RGB colors
opt.wrap = false           -- don't wrap lines
opt.splitright = true      -- splits open on the right
opt.splitbelow = true      -- splits open below
opt.clipboard = "unnamedplus"
