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
        require("lint").try_lint()
    end,
})
