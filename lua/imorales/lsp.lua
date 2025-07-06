local M        = {}

local map      = require("imorales.keymap")
local keybind  = require("imorales.keybind")
local language = require("imorales.lang")

------------------------------------------
-- automatic installation & integration --
------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})
require("coq")

--

local on_attach = function(client, buffer)
    client.server_capabilities.semanticTokensProvider = nil
    for key_stroke, callback in pairs(keybind.lsp.nnoremap) do
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
        local config = {
            flags     = { debounce_text_changes = 150 },
            settings  = server.settings,
            on_attach = on_attach,
        }
        if server.filetypes ~= nil then
            config.filetypes = server.filetypes
        end
        if server.init_options ~= nil then
            config.init_options = server.init_options
        end
        local lspconfig = require('coq').lsp_ensure_capabilities(config)
        require("lspconfig")[server.name].setup(lspconfig)
    end
end

return M
