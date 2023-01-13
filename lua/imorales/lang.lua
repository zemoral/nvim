local M = {}

M.bash = {
    lsp = 'bashls'
}

M.css = {
    lsp = 'cssmodules_ls'
}

M.docker = {
    lsp = 'dockerls'
}

M.go = {
    lsp = 'gopls'
}

M.html = {
    lsp = 'html'
}

M.json = {
    lsp = 'jsonls'
}

M.lua = {
    lsp = 'sumneko_lua',
    lsp_settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                },
            },
        },
    },
}

M.markdown = {
    lsp = 'marksman'
}

M.python = {
    lsp = 'pyright'
}

M.rust = {
    lsp = 'rust_analyzer'
}

M.toml = {
    lsp = 'taplo'
}

M.typescript = {
    lsp = 'tsserver'
}

M.vim = {
    lsp = 'vimls'
}

M.vue = {
    lsp = 'vuels'
}

M.yaml = {
    lsp = 'yamlls'
}

return M
