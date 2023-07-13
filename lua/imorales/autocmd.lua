local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 75 })
    end
})

-- close nvim-tree before exiting
autocmd('QuitPre', {
    callback = function()
        vim.cmd(":NvimTreeClose")
    end
})

-- reload folds
autocmd('BufEnter', {
    callback = function()
        vim.cmd(":normal zx")
    end
})

-- linting
autocmd('BufWritePost', {
    callback = function()
        vim.cmd(":silent lua require('lint').try_lint()")
    end
})

-- open nvim-tree before entering, auto complete
autocmd('VimEnter', {
    callback = function()
        local win = vim.api.nvim_get_current_win()
        vim.cmd(":COQnow --shut-up")
        vim.cmd(":NvimTreeOpen")
        vim.api.nvim_set_current_win(win)
    end
})
