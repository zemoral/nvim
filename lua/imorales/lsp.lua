local M = {}

local map = require("imorales.keymap")
local nnoremap = map.nnoremap

-- automatic installation & configuration --
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- language support --
local lspconfig    = require("lspconfig")
local languages    = require("imorales.lang")
local autocomplete = require("coq")

local keymap       = {
    -- 
    ['K']          = vim.lsp.buf.hover,
    ['<C-k>']      = vim.lsp.buf.signature_help,
    --
    ['gD']         = vim.lsp.buf.declaration,
    ['gd']         = vim.lsp.buf.definition,
    ['gt']         = vim.lsp.buf.type_definition,
    ['gi']         = vim.lsp.buf.implementation,
    ['gr']         = vim.lsp.buf.references,
    --
    ['vd']         = vim.diagnostic.open_float,
    --
    ['<leader>rn'] = vim.lsp.buf.rename,
    ['<leader>ca'] = vim.lsp.buf.code_action,
    ['<leader>f']  = languages.format,
    --
}

local attach       = function(_, buffer)
    vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    for key_stroke, func in pairs(keymap) do
        nnoremap(key_stroke, function() func() end, { silent = true, buffer = buffer })
    end
    languages.set_buffer_language(vim.bo.filetype)
end

function M.setup()
    for lang in pairs(languages.setup) do
        local server = languages.get_language_server(lang)
        lspconfig[server.name].setup(autocomplete.lsp_ensure_capabilities({
            flags     = { debounce_text_changes = 150 },
            settings  = server.settings,
            on_attach = attach,
        }))
    end
end

return M
