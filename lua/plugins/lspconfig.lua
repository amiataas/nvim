-- ┌───────────┐
-- │ ┬  ┌─┐┌─┐ │
-- │ │  └─┐├─┘ │
-- │ ┴─┘└─┘┴   │
-- └───────────┘

return {
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			for _, ls in ipairs(require('lsp.lsplist')) do
				require('lsp.' .. ls)
			end

			local keymapSet = vim.keymap.set
			local function quickfix()
				vim.lsp.buf.code_action({
					filter = function(a) return a.isPreferred end,
					apply = true
				})
			end

			local opts = { noremap = true, silent = true }
			keymapSet('n', '<leader>qf', quickfix, opts)

		end
	}
}
