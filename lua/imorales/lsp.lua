local M = {}

-- convenience --
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

-- lsp keybindings --
local keymap       = {
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
    ['<leader>f']  = function()
        local filetype = vim.bo.filetype
        local cmd = languages.get_format(filetype)
        if not cmd then
            vim.lsp.buf.format({ async = true })
            return
        end
        vim.cmd(':silent execute "!' .. cmd .. ' %"')
    end,
}

-- lsp setup --
local on_attach    = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { silent = true, buffer = bufnr }
    for stroke, func in pairs(keymap) do
        nnoremap(stroke, function() func() end, opts)
    end
end

local flags        = {
    debounce_text_changes = 150
}
function M.setup()
    for lang in pairs(languages.all) do
        local server = languages.get_lsp(lang)
        lspconfig[server.name].setup(autocomplete.lsp_ensure_capabilities({
            flags     = flags,
            settings  = server.settings,
            on_attach = on_attach,
        }))
    end
end

return M
