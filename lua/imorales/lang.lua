local M = { setup = {} }

--------------
-- projects --
--------------
local yarn = {
    format_cmd = '!yarn run prettier --write %',
    init       = function()
        vim.bo.tabstop     = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth  = 2
    end
}

local with = function(default_settings, settings)
    return vim.tbl_extend("force", default_settings or {}, settings)
end

---------------
-- languages --
---------------
M.setup.astro = with(yarn, {
    lsp = 'astro'
})

M.setup.bash = {
    lsp = 'bashls'
}

M.setup.css = with(yarn, {
    lsp = 'cssls',
})

M.setup.scss = with(yarn, {
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
}

M.setup.json = with(yarn, {
    lsp = 'jsonls',
})

M.setup.lua = {
    lsp          = 'lua_ls',
    lsp_settings = {
        Lua = { diagnostics = { globals = { 'vim' } } },
    },
    run_cmd      = "luafile %",
}

M.setup.markdown = {
    lsp = 'marksman',
}

M.setup.python = {
    lsp     = 'pyright',
    run_cmd = "!python3 %",
    fmt_cmd = "!isort % && black %",
}

M.setup.rust = {
    lsp     = 'rust_analyzer',
    fmt_cmd = "!cargo +nightly fmt -- %",
}

M.setup.toml = {
    lsp = 'taplo'
}

M.setup.typescript = with(yarn, {
    lsp = 'tsserver',
})

M.setup.vim = {
    lsp = 'vimls'
}

M.setup.vue = with(yarn, {
    lsp = 'vuels',
})

M.setup.yaml = {
    lsp          = 'yamlls',
    lsp_settings = {
        yaml = { keyOrdering = false }
    }
}

--------------
-- commands --
--------------
function M.format()
    vim.cmd.write()
    local language = M.setup[vim.bo.filetype]
    if language and language.fmt_cmd then
        vim.cmd(':silent execute ":' .. M.setup[language].fmt_cmd .. '"')
    else
        vim.lsp.buf.format({ async = true })
    end
end

function M.run()
    local language = M.setup[vim.bo.filetype]
    if language and language.run_cmd then
        vim.cmd(':write')
        vim.cmd(':messages clear')
        vim.cmd(':' .. language.run_cmd)
    end
end

---------------
-- lspconfig --
---------------
function M.get_language_server(language)
    return {
        name     = configured.lsp or '',
        settings = configured.lsp_settings or {},
    }
end

function M.on_attach(language)
    if M.setup[language].init then
        M.setup[language].init()
    end
end

return M
