local map       = require("imorales.keymap")
local language  = require("imorales.lang")
local telescope = require('telescope.builtin')
local silent    = { silent = true }

---------------
-- movements --
---------------

-- line up, down
map.nnoremap('<C-[>', function() vim.cmd(':m .+1') end, silent)
map.nnoremap('<C-]>', function() vim.cmd(':m .-2') end, silent)

-- page up, down
map.nnoremap('}', '<C-U>zz', silent)
map.nnoremap('{', '<C-D>zz', silent)

----------------
-- operations --
----------------

-- yank to system clipboard
map.vnoremap('<A-C>', function() vim.cmd(':y+"') end, silent)

-- spawn horizontal, vertical pane
map.nnoremap('<A-h>', function() vim.cmd(':split %') end, silent)
map.nnoremap('<A-v>', function() vim.cmd(':botright vsp %') end, silent)

-- close window, prevent plugin cleanup
map.nnoremap('<leader><esc>', function()
    vim.g.ignore_quit = true
    vim.cmd.quit()
end, silent)

-----------------------
-- language settings --
-----------------------

-- format
map.nnoremap('<leader>f', language.format, silent)

-- run
map.nnoremap('<leader>%', language.run)

-------------
-- plugins --
-------------

-- treesitter token
map.nnoremap('<leader>tt', function()
    vim.cmd(":TSHighlightCapturesUnderCursor")
end)

-- telescope
map.nnoremap('<C-p>', telescope.find_files)
map.nnoremap('<C-f>', telescope.live_grep)
map.nnoremap('<C-g>', telescope.git_files)
map.nnoremap('<C-y>', telescope.git_status)
map.nnoremap('<C-b>', telescope.buffers)
map.nnoremap('<C-t>', telescope.help_tags)

-- nvim-tree
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
