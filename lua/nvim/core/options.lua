local options = {
    -- line numbers
    relativenumber = true,
    -- clipboard
    clipboard = "unnamedplus",
    -- indentation
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    autoindent = true,
    smartindent = true,
    -- lines
    wrap = false,
    -- search
    ignorecase = true,
    smartcase = true,
    -- colours
    termguicolors = true,
    background = "light",
    -- backspace
    backspace = "indent,eol,start"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.netrw_liststyle = 3
