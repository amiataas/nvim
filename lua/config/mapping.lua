-- ┌────────────────────────┐
-- │ ┌┬┐┌─┐┌─┐┌─┐┬┌┐┌┌─┐┌─┐ │
-- │ │││├─┤├─┘├─┘│││││ ┬└─┐ │
-- │ ┴ ┴┴ ┴┴  ┴  ┴┘└┘└─┘└─┘ │
-- └────────────────────────┘

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
