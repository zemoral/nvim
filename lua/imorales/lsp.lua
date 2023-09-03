local M = {}

local map = require("imorales.keymap")
local language_settings = require("imorales.lang")

-- automatic installation & configuration --
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- keybindings --
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
    ['<leader>f']  = language_settings.format,
    ['<leader>%']  = language_settings.run,
}

local on_attach    = function(client, buffer)
    client.server_capabilities.semanticTokensProvider = nil
    for key_stroke, func in pairs(keymap) do
        map.nnoremap(key_stroke, function() func() end, { silent = true, buffer = buffer })
    end
    language_settings.on_attach(vim.bo.filetype)
end

function M.setup()
    local lsp = require("lspconfig")
    local auto_complete = require("coq")

    for lang in pairs(language_settings.setup) do
        local server = language_settings.get_language_server(lang)
        local config = auto_complete.lsp_ensure_capabilities{
            flags        = { debounce_text_changes = 150 },
            settings     = server.settings,
            on_attach    = on_attach,
        }
        lsp[server.name].setup(config)
    end
end

return M
