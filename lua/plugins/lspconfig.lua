return {
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			for _, ls in ipairs(require('lsp.lsplist')) do
				require('lsp.'..ls)
			end
		end
	}
}
