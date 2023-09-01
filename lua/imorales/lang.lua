local M = { setup = {} }

local project = {
    vue3 = {
        format_cmd = 'yarn run prettier --write',
        init       = function()
            vim.bo.tabstop     = 2
            vim.bo.softtabstop = 2
            vim.bo.shiftwidth  = 2
        end
    }
}

local with_project = function(p, settings)
    return vim.tbl_extend("force", project[p] or {}, settings)
end

local client = 'vue3'

M.setup.bash = {
    lsp = 'bashls'
}

M.setup.css = with_project(client, {
    lsp = 'cssls',
})

M.setup.scss = with_project(client, {
    lsp = 'cssls',
})

M.setup.docker = {
    lsp = 'dockerls',
}

M.setup.go = {
    lsp = 'gopls',
}

M.setup.html = {
    lsp = 'html',
    format_cmd = "yarn run prettier --write",
}

M.setup.json = with_project(client, {
    lsp  = 'jsonls',
    lint = 'eslint',
})

M.setup.lua = {
    lsp          = 'lua_ls',
    lsp_settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                },
            },
        },
    },
    run_cmd      = "luafile %",
}

M.setup.markdown = {
    lsp = 'marksman',
}

M.setup.python = {
    lsp = 'pyright',
    format_cmd = "black",
}

M.setup.rust = {
    lsp = 'rust_analyzer'
}

M.setup.toml = {
    lsp = 'taplo'
}

M.setup.typescript = with_project(client, {
    lsp = 'tsserver',
})

M.setup.vim = {
    lsp = 'vimls'
}

-- Vue 2
-- setup.vue = {
--    lsp        = 'vuels',
--    format_cmd = 'yarn run vue-cli-service lint --fix',
--}

-- Vue 3
M.setup.vue = with_project(client, {
    lsp = 'volar',
})

M.setup.yaml = {
    lsp = 'yamlls'
}

function M.format()
    local language = vim.bo.filetype
    vim.cmd(':write')
    if M.setup[language].format_cmd == nil then
        vim.lsp.buf.format({ async = true })
        return
    end
    vim.cmd(':silent execute "!' .. M.setup[language].format_cmd .. ' %"')
end

function M.run()
    local language = vim.bo.filetype
    vim.cmd(':write')
    if M.setup[language].run_cmd ~= nil then
        vim.cmd(':' .. M.setup[language].run_cmd)
    end
end

function M.get_language_server(language)
    return {
        name     = M.setup[language].lsp or '',
        settings = M.setup[language].lsp_settings or {},
    }
end

function M.set_buffer_language(language)
    if M.setup[language].init ~= nil then
        M.setup[language].init()
    end
end

return M
