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
        if vim.g.ignore_quit then
            vim.g.ignore_quit = false
            return
        end
        vim.cmd(":NvimTreeClose")
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
