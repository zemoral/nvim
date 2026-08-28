local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local imorales = augroup("imorales", { clear = true })

-- highlight on yank
autocmd("TextYankPost", {
    group    = imorales,
    callback = function()
        vim.highlight.on_yank({ timeout = 75 })
    end
})

-- close global buffers before exiting
autocmd('QuitPre', {
    group    = imorales,
    callback = function()
        if vim.g.ignore_quit then
            vim.g.ignore_quit = false
            return
        end
        vim.cmd(":cclose")
        vim.cmd(":NvimTreeClose")
    end
})

-- open nvim-tree before entering, completion
autocmd('VimEnter', {
    group    = imorales,
    callback = function()
        local win = vim.api.nvim_get_current_win()
        vim.cmd(":COQnow --shut-up")
        vim.cmd(":NvimTreeOpen")
        vim.api.nvim_set_current_win(win)
    end
})

-- track "global" buffers
autocmd("FileType", {
    group    = imorales,
    pattern  = "TelescopePrompt",
    callback = function(args)
        vim.g.telescope_bufnr = args.buf
    end,
})
autocmd("FileType", {
    group    = imorales,
    pattern  = "qf",
    callback = function(args)
        vim.g.quickfix_bufnr = args.buf
    end,
})
