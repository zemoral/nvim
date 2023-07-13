local map    = require("imorales.keymap")
local silent = { silent = true }

-- inspect token
map.nnoremap('<leader>tt', function()
    vim.cmd(":TSHighlightCapturesUnderCursor")
end, silent)

-- line up, down
map.nnoremap('<C-[>', function()
    vim.cmd(':m .+1')
end, silent)

map.nnoremap('<C-]>', function()
    vim.cmd(':m .-2')
end, silent)

-- telescope
map.nnoremap('<C-p>', function()
    require('telescope.builtin').find_files()
end, silent)

map.nnoremap('<C-f>', function()
    require('telescope.builtin').live_grep()
end, silent)

-- page up, down
map.nnoremap('{', '<C-U>zz', silent)

map.nnoremap('}', '<C-D>zz', silent)

-- nvim-tree
map.nnoremap('<C-n>', function()
    if vim.bo.filetype == 'NvimTree' then
        vim.api.nvim_set_current_win(vim.g.before_nvim_enter)
        vim.g.before_nvim_enter = nil
    else
        vim.g.before_nvim_enter = vim.api.nvim_get_current_win()
        vim.cmd(":NvimTreeFocus")
    end
end, silent)

map.nnoremap('NN', function()
    vim.cmd(':NvimTreeToggle')
end, silent)

-- force lsp update
map.nnoremap('?', function()
    vim.lsp.codelens.refresh()
end, silent)

-- yank to system clipboard
map.vnoremap('<C-A-c', function()
    vim.cmd(':y+"')
end, silent)
