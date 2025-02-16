return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'nvim-neotest/nvim-nio'
		}
	},
	config = function()
		local dap = require('dap')

		dap.adapters = require('adapters').get_adapters()

		dap.configurations = require('adapters.config').get_config()
		-- Keymaps
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set

		keymap('n', '<leader>dr', dap.repl.open, opts)
		keymap('n', '<leader>db', dap.toggle_breakpoint, opts)
		keymap('n', '<leader>do', dap.step_over, opts)
		keymap('n', '<leader>dc', dap.continue, opts)
	end
}
