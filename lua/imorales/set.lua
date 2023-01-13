-- globals
vim.g.mapleader = " "

-- options
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
-- vim.opt.hlsearch = false

vim.opt.updatetime = 50

-- autocmds
vim.cmd(":au TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 75 })")

-- bindings
require('imorales.remaps')
