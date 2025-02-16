local get_adapters = function()
	return {
		-- ┌───────────┐
		-- │ ┌─┐┌┬┐┌┐  │
		-- │ │ ┬ ││├┴┐ │
		-- │ └─┘─┴┘└─┘ │
		-- └───────────┘
		gdb = {
			type = 'executable',
			command = 'gdb',
			args = { '--interpreter=dap' },
			name = 'gdb',
		},
		-- ┌──────────────────────────┐
		-- │ ┌─┐┌─┐┌┬┐┌─┐┬  ┬  ┌┬┐┌┐  │
		-- │ │  │ │ ││├┤ │  │   ││├┴┐ │
		-- │ └─┘└─┘─┴┘└─┘┴─┘┴─┘─┴┘└─┘ │
		-- └──────────────────────────┘
		codelldb = {
			type = 'executable',
			command = vim.fn.stdpath('data') .. '/dap/codelldb/adapter/codelldb',
		},
		-- ┌────────────────────┐
		-- │ ┌─┐┬ ┬┌┬┐┬ ┬┌─┐┌┐┌ │
		-- │ ├─┘└┬┘ │ ├─┤│ ││││ │
		-- │ ┴   ┴  ┴ ┴ ┴└─┘┘└┘ │
		-- └────────────────────┘
		python = {
			type = 'executable',
			command = (os.getenv('VIRTUAL_ENV') or '/usr') .. '/bin/python',
			args = { '-m', 'debugpy.adapter' },
			options = {
				source_filetype = 'python',
			},
		},
	}
end

return {
	get_adapters = get_adapters
}
