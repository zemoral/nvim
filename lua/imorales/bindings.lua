local Remap    = require("imorales.keymap")
local nnoremap = Remap.nnoremap
local silent   = { silent = true }

nnoremap('<leader>tt', function()
    vim.cmd(":TSHighlightCapturesUnderCursor")
end, silent)
