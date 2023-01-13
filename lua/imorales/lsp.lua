local M = {}
-- bindings --
local Remap = require("imorales.keymap")
local nnoremap = Remap.nnoremap

-- required for automatic installation
-- language servers defined in `servers` are automatically installed and configured
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- language support --
local lspconfig = require("lspconfig")
local languages = require("imorales.lang")

-- lsp keymaps --
local keymap = {
    ['K']          = vim.lsp.buf.hover,
    ['gD']         = vim.lsp.buf.declaration,
    ['gd']         = vim.lsp.buf.definitions,
    ['gi']         = vim.lsp.buf.implementation,
    ['gr']         = vim.lsp.buf.references,
    ['vd']         = vim.diagnostic.open_float,
    ['<C-k>']      = vim.lsp.buf.signature_help,
    ['<leader>wa'] = vim.lsp.buf.add_workspace_folder,
    ['<leader>wr'] = vim.lsp.buf.remove_workspace_folder,
    ['<leader>D']  = vim.lsp.buf.type_definition,
    ['<leader>rn'] = vim.lsp.buf.rename,
    ['<leader>ca'] = vim.lsp.buf.code_action,
    ['<leader>f']  = function() vim.lsp.buf.format(
            {
                async  = true,
                filter = function(client)
                    if client.name == 'vuels' then
                        vim.cmd(':!yarn run vue-cli-service lint --fix')
                        return false
                    end
                    return true
                end
            })
    end,
}

-- lsp setup --
local on_attach = function(_, bufnr)
    -- autocomplete <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- attach lsp keymap
    local opts = { silent = true, buffer = bufnr }
    for stroke, func in pairs(keymap) do
        nnoremap(stroke, function() func() end, opts)
    end
end

local flags = {
    debounce_text_changes = 150
}

function M.setup()
    for lang in pairs(languages) do
        local config = languages[lang]
        lspconfig[config.lsp].setup({
            flags     = flags,
            settings  = config.lsp_settings or {},
            on_attach = on_attach,
        })
    end
end

return M
