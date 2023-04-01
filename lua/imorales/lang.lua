local M = { setup = {}}

-- TODO: extract language configuration from files
-- TODO: 'projects' - multi-language configuration
M.setup.bash = {
    lsp = 'bashls'
}

M.setup.css = {
    lsp = 'cssmodules_ls'
}

M.setup.docker = {
    lsp = 'dockerls'
}

M.setup.go = {
    lsp = 'gopls'
}

M.setup.html = {
    lsp = 'html',
    format_cmd = 'yarn run prettier --write'
}

M.setup.json = {
    lsp        = 'jsonls',
    lint       = 'eslint',
    format_cmd = 'yarn run prettier --write'
}

M.setup.lua = {
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

M.setup.markdown = {
    lsp = 'marksman',
}

M.setup.python = {
    lsp = 'pyright'
}

M.setup.rust = {
    lsp = 'rust_analyzer'
}

M.setup.toml = {
    lsp = 'taplo'
}

M.setup.typescript = {
    lsp        = 'tsserver',
    lint       = 'eslint',
    format_cmd = 'yarn run prettier --write',
    init       = function()
        vim.bo.tabstop     = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth  = 2
    end
}

M.setup.vim = {
    lsp = 'vimls'
}

-- Vue 2
-- setup.vue = {
--    lsp        = 'vuels',
--    format_cmd = 'yarn run vue-cli-service lint --fix',
--}

-- Vue 3
M.setup.vue = {
    lsp        = 'volar',
    lint       = 'eslint',
    format_cmd = 'yarn run prettier --write',
    init       = function()
        vim.bo.tabstop     = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth  = 2
    end
}

M.setup.yaml = {
    lsp = 'yamlls'
}

function M.format()
    local language = vim.bo.filetype
    if M.setup[language].format_cmd == nil then
        vim.lsp.buf.format({ async = true })
        return
    end
    vim.cmd(':silent execute "!' .. M.setup[language].format_cmd .. ' %"')
end

function M.get_language_server(language)
    return {
        name     = M.setup[language].lsp or {},
        settings = M.setup[language].lsp_settings or {},
    }
end

function M.set_buffer_language(language)
    if M.setup[language].lint ~= nil then
        require("lint").linters_by_ft = { [language] = { M.setup[language].lint, } }
    end
    if M.setup[language].init ~= nil then
        M.setup[language].init()
    end
end

return M
