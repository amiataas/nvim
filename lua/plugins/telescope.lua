return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-dap.nvim'
	},
	config = function ()
		local telescope = require('telescope')

		telescope.setup({
			extensions = {
				'dap',
			},
		})
	end
}
