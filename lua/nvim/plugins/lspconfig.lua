local function setup()
    local lspconfig = require('lspconfig')

    -- Function to setup LSP servers with common settings
    local function on_attach(client, bufnr)
        -- Key mappings and other buffer-specific settings
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Mappings.
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true, silent=true })
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
        buf_set_keymap('n', 'gR', '<cmd>Telescope lsp_references<CR>', { noremap=true, silent=true })
    end

    -- Setup servers
    local servers = { 'lua_ls', 'pyright', 'tsserver', 'clangd', 'gopls', 'jdtls' }
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end
end


return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = setup
}

