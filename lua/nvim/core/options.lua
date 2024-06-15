local options = {
    -- line numbers
    relativenumber = true,
    -- clipboard
    clipboard = "unnamedplus",
    -- indentation
    autoindent = true,
    expandtab = true,
    shiftwidth = 2,
    smartindent = true,
    tabstop = 2,
    -- lines
    wrap = false,
    -- search
    ignorecase = true,
    smartcase = true,
    -- colours
    termguicolors = true,
    background = "light",
    -- backspace
    backspace = "indent,eol,start",
    -- windows
    splitright = true,
    splitbelow = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.netrw_liststyle = 3
