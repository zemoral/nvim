local map    = require("imorales.keymap")
local silent = { silent = true }

-- inspect token --
map.nnoremap('<leader>tt', function()
    vim.cmd(":TSHighlightCapturesUnderCursor")
end, silent)

-- line up, down --
map.nnoremap('<C-[>', function()
    vim.cmd(':m .+1')
end, silent)

map.nnoremap('<C-]>', function()
    vim.cmd(':m .-2')
end, silent)

-- telescope --
map.nnoremap('<C-p>', function()
    require('telescope.builtin').find_files()
end, silent)

map.nnoremap('<C-f>', function()
    require('telescope.builtin').live_grep()
end, silent)

map.nnoremap('<C-g>', function()
    require('telescope.builtin').git_files()
end, silent)

-- page up, down --
map.nnoremap('{', '<C-U>zz', silent)

map.nnoremap('}', '<C-D>zz', silent)

-- force lsp update --
map.nnoremap('?', function()
    vim.lsp.codelens.refresh()
end, silent)

-- yank to system clipboard --
map.vnoremap('<A-C>', function()
    vim.cmd(':y+"')
end, silent)

-- custom quit --
map.nnoremap('<leader><esc>', function()
    vim.g.ignore_quit = true
    vim.cmd(":q")
end, silent)

-- inspection --
map.nnoremap('<leader>win', function()
    vim.cmd(":lua print(vim.api.nvim_get_current_win())")
end, silent)

map.nnoremap('<leader>buf', function()
    vim.cmd(":lua print(vim.api.nvim_get_current_buf())")
end, silent)

-- nvim-tree --
map.nnoremap('<C-n>', function()
    if vim.bo.filetype == 'NvimTree' then
        vim.api.nvim_set_current_win(vim.g.before_tree_enter)
        vim.g.before_tree_enter = nil
    else
        vim.g.before_tree_enter = vim.api.nvim_get_current_win()
        vim.cmd(":NvimTreeFocus")
    end
end, silent)

map.nnoremap('NN', function()
    vim.cmd(":NvimTreeToggle")
end, silent)
