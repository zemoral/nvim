-- bindings --
local Remap = require("imorales.keymap")
local nnoremap = Remap.nnoremap

-- required for automatic installation
-- language servers defined in `config` are automatically installed and configured
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- lsp configurations --
local servers = {
    -- bash
    ['bashls'] = {},
    -- css
    ['cssmodules_ls'] = {},
    -- docker
    ['dockerls'] = {},
    -- go
    ['gopls'] = {},
    -- html
    ['html'] = {},
    -- json
    ['jsonls'] = {},
    -- lua
    ['sumneko_lua'] = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                },
            },
            telemetry = {
                enable = false
            },
        },
    },
    -- markdown
    ['remark_ls'] = {},
    -- python
    ['pyright'] = {},
    -- rust
    ['rust_analyzer'] = {},
    -- svelte
    ['svelte'] = {},
    -- toml
    ['taplo'] = {},
    -- js,ts
    ['tsserver'] = {},
    -- vim
    ['vimls'] = {},
    -- vue
    ['vuels'] = {},
    -- yaml
    ['yamlls'] = {},
}

-- lsp keymaps --
local keymap = {
    ['gD'] = vim.lsp.buf.declaration,
    ['gd'] = vim.lsp.buf.definitions,
    ['K'] = vim.lsp.buf.hover,
    ['gi'] = vim.lsp.buf.implementation,
    ['<C-k>'] = vim.lsp.buf.signature_help,
    ['<space>wa'] = vim.lsp.buf.add_workspace_folder,
    ['<space>wr'] = vim.lsp.buf.remove_workspace_folder,
    ['<space>D'] = vim.lsp.buf.type_definition,
    ['<space>rn'] = vim.lsp.buf.rename,
    ['<space>ca'] = vim.lsp.buf.code_action,
    ['gr'] = vim.lsp.buf.references,
    ['<space>f'] = vim.lsp.buf.formatting,
}

-- lsp setup --
local on_attach = function(_, bufnr)
    -- autocomplete <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- attach lsp keymap
    local opts = { silent = true, buffer = bufnr }
    for keymap, func in pairs(keymap) do
        nnoremap(keymap, function() func() end, opts)
    end
end

local flags = {
    debounce_text_changes = 150
}

local M = {}
function M.setup()
    for server in pairs(servers) do
        require('lspconfig')[server].setup({
            flags = flags,
            settings = servers[server],
            on_attach = on_attach,
        })
    end
end

return M
