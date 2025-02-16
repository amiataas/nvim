return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('lualine').setup({
				options = {
					theme = 'seoul256',
					disabled_filetypes = { 'NvimTree', 'packer' },
				},
			})
		end,
	}
}
