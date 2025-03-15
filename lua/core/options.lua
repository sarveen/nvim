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

-- Status Line
opt.laststatus = 3


-- Disable built-in snippets
if vim.fn.has('nvim-0.11') == 1 then
-- Ensure that forced and not configurable `<Tab>` and `<S-Tab>`
-- buffer-local mappings don't override already present ones
local expand_orig = vim.snippet.expand
vim.snippet.expand = function(...)
  local tab_map = vim.fn.maparg('<Tab>', 'i', false, true)
  local stab_map = vim.fn.maparg('<S-Tab>', 'i', false, true)
  expand_orig(...)
  vim.schedule(function()
    tab_map.buffer, stab_map.buffer = 1, 1
    -- Override temporarily forced buffer-local mappings
    vim.fn.mapset('i', false, tab_map)
    vim.fn.mapset('i', false, stab_map)
  end)
end
end
