local M = {}

local map = require("imorales.keymap")
local language = require("imorales.lang")

------------------------------------------
-- automatic installation & integration --
------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})
require("coq")

------------------
-- key bindings --
------------------
local keymap    = {
    --
    ['K']          = vim.lsp.buf.hover,
    ['<C-k>']      = vim.lsp.buf.signature_help,
    --
    ['gD']         = vim.lsp.buf.declaration,
    ['gd']         = vim.lsp.buf.definition,
    ['gt']         = vim.lsp.buf.type_definition,
    ['gi']         = vim.lsp.buf.implementation,
    ['gr']         = require("telescope.builtin").lsp_references,
    --
    ['vd']         = vim.diagnostic.open_float,
    --
    ['<leader>rn'] = vim.lsp.buf.rename,
    ['<leader>ca'] = vim.lsp.buf.code_action,
}

local on_attach = function(client, buffer)
    client.server_capabilities.semanticTokensProvider = nil
    for key_stroke, callback in pairs(keymap) do
        map.nnoremap(key_stroke, callback, {
            silent = true,
            buffer = buffer,
        })
    end
    language.on_attach(vim.bo.filetype)
end

function M.setup()
    for name in pairs(language.setup) do
        local server = language.get_language_server(name)
        local config = require('coq').lsp_ensure_capabilities({
            flags     = { debounce_text_changes = 150 },
            settings  = server.settings,
            on_attach = on_attach,
        })
        require("lspconfig")[server.name].setup(config)
    end
end

return M
