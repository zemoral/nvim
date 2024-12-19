local M         = {}

local keymap    = require("imorales.keymap")
local language  = require("imorales.lang")
local telescope = require('telescope.builtin')
local silent    = { silent = true }

---------------
-- movements --
---------------

-- line up, down
keymap.nnoremap('<C-[>', function() vim.cmd(':m .+1') end, silent)
keymap.nnoremap('<C-]>', function() vim.cmd(':m .-2') end, silent)

-- page up, down
keymap.nnoremap('}', '<C-U>zz', silent)
keymap.nnoremap('{', '<C-D>zz', silent)

----------------
-- operations --
----------------

-- yank to system clipboard
keymap.vnoremap('<A-C>', function() vim.cmd(':y+"') end, silent)

-- spawn horizontal, vertical pane
keymap.nnoremap('<A-h>', function() vim.cmd(':split %') end, silent)
keymap.nnoremap('<A-v>', function() vim.cmd(':botright vsp %') end, silent)

-- close window, prevent plugin cleanup
keymap.nnoremap('<leader><esc>', function()
    vim.g.ignore_quit = true
    vim.cmd.quit()
end, silent)

-----------------------
-- language settings --
-----------------------

-- format
keymap.nnoremap('<leader>f', language.format, silent)

-- runner
keymap.nnoremap('<leader>%', language.run)

-- lsp assigned on_attach
M.lsp = {
    nnoremap = {
        --
        ['K']          = vim.lsp.buf.hover,
        ['<C-k>']      = vim.lsp.buf.signature_help,
        --
        ['gD']         = vim.lsp.buf.declaration,
        ['gd']         = vim.lsp.buf.definition,
        ['gt']         = vim.lsp.buf.type_definition,
        ['gi']         = vim.lsp.buf.implementation,
        ['gr']         = telescope.lsp_references,
        --
        ['vd']         = vim.diagnostic.open_float,
        --
        ['<leader>rn'] = vim.lsp.buf.rename,
        ['<leader>ca'] = vim.lsp.buf.code_action,
    }
}

-------------
-- plugins --
-------------

-- treesitter token
keymap.nnoremap('<leader>tt', function()
    vim.cmd(":TSHighlightCapturesUnderCursor")
end)

-- telescope
keymap.nnoremap('<C-p>', telescope.find_files)
keymap.nnoremap('<C-f>', telescope.live_grep)
keymap.nnoremap('<C-g>', telescope.git_files)
keymap.nnoremap('<C-y>', telescope.git_status)
keymap.nnoremap('<C-b>', telescope.buffers)
keymap.nnoremap('<C-t>', telescope.help_tags)

-- nvim-tree
keymap.nnoremap('<C-n>', function()
    if vim.bo.filetype == 'NvimTree' then
        vim.api.nvim_set_current_win(vim.g.before_tree_enter)
        vim.g.before_tree_enter = nil
    else
        vim.g.before_tree_enter = vim.api.nvim_get_current_win()
        vim.cmd(":NvimTreeFocus")
    end
end, silent)

keymap.nnoremap('NN', function()
    vim.cmd(":NvimTreeToggle")
end, silent)

--
return M
