local M = {}
local setup = {}

setup.bash = {
    lsp = 'bashls'
}

setup.css = {
    lsp = 'cssmodules_ls'
}

setup.docker = {
    lsp = 'dockerls'
}

setup.go = {
    lsp = 'gopls'
}

setup.html = {
    lsp = 'html'
}

setup.json = {
    lsp = 'jsonls'
}

setup.lua = {
    lsp = 'lua_ls',
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

setup.markdown = {
    lsp = 'marksman',
}

setup.python = {
    lsp = 'pyright'
}

setup.rust = {
    lsp = 'rust_analyzer'
}

setup.toml = {
    lsp = 'taplo'
}

setup.typescript = {
    lsp = 'tsserver'
}

setup.vim = {
    lsp = 'vimls'
}

setup.vue = {
    lsp        = 'vuels',
    format_cmd = 'yarn run vue-cli-service lint --fix',
}

setup.yaml = {
    lsp = 'yamlls'
}

M.all = setup

function M.get_lsp(language)
    return {
        name     = setup[language].lsp or {},
        settings = setup[language].lsp_settings or {},
    }
end

function M.get_format(language)
    return setup[language].format_cmd or false
end

return M
