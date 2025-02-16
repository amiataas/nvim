return {
	'lukas-reineke/lsp-format.nvim',
	keys = {
		{ '<C-f>', '<CMD>lua vim.lsp.buf.format()<CR>', desc = 'Format' },
	},
	config = function()
		require('lsp-format').setup({})
	end
}
