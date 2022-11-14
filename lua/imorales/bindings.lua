local map    = require("imorales.keymap")
local silent = { silent = true }


-- inspect token
map.nnoremap('<leader>tt', function()
    vim.cmd("TSHighlightCapturesUnderCursor")
end, silent)


-- line up, down
map.nnoremap('<A-j>', function()
    vim.cmd(':m .+1')
end, silent)

map.nnoremap('<A-k>', function()
    vim.cmd(':m .-2')
end, silent)


-- telescope
map.nnoremap('<C-p>', function()
    require('telescope.builtin').find_files()
end, silent)

map.nnoremap('<C-s>', function()
    require('telescope.builtin').live_grep()
end, silent)
