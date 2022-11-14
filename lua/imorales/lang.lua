local M = {}

M.all = {
    bash = {
        { 'bashls' }
    },

    css = {
        { 'cssmodules_ls' }
    },

    docker = {
        { 'dockerls' }
    },

    go = {
        { 'gopls' }
    },

    html = {
        { 'html' }
    },

    json = {
        { 'jsonls' }
    },

    lua = {
        { 'sumneko_lua', {
            Lua = {
                diagnostics = {
                    globals = {
                        'vim'
                    },
                },
                telemetry   = {
                    enable = false
                }
            }
        } },
    },

    markdown = {
        { 'marksman' },
    },

    python = {
        { 'pyright' }
    },

    rust = {
        { 'rust_analyzer' }
    },

    toml = {
        { 'taplo' }
    },

    typescript = {
        { 'tsserver' }
    },

    vim = {
        { 'vimls' }
    },

    vue = {
        { 'vuels' }
    },

    yaml = {
        { 'yamlls' }
    }
}

function M.get_lsp_server(lang)
    local lsp = M.all[lang][1]
    local server, settings = lsp[1], lsp[2] or {}
    return server, settings
end

return M
