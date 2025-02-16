-- Keyboard Mappings

-- Options
local opts = { noremap = true, silent = true }

-- Shorthand keymap function
local keymap = vim.api.nvim_set_keymap
local keymapSet = vim.keymap.set

local function quickfix()
	vim.lsp.buf.code_action({
		filter = function(a) return a.isPreferred end,
		apply = true
	})
end

-- Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvim Tree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Don't lose visual on indentation
keymap("v", '<', '<gv', opts)
keymap("v", '>', '>gv', opts)

-- LSP Related
keymapSet("n", '<leader>qf', quickfix, opts)
