local get_config = function()
	return {
		-- ┌─────┐
		-- │ ┌─┐ │
		-- │ │   │
		-- │ └─┘ │
		-- └─────┘
		c = {
			{
				name = 'Launch GDB',
				type = 'gdb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = 'Launch CodeLLDB',
				type = 'codelldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
			}
		},
		-- ┌────────────────────┐
		-- │ ┌─┐┬ ┬┌┬┐┬ ┬┌─┐┌┐┌ │
		-- │ ├─┘└┬┘ │ ├─┤│ ││││ │
		-- │ ┴   ┴  ┴ ┴ ┴└─┘┘└┘ │
		-- └────────────────────┘
		python = {
			{
				type = 'python',
				request = 'launch',
				name = 'Launch file',
				program = '${file}',
				pythonPath = function()
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. '/bin/python') == 1 then
						return cwd .. '/bin/python'
					else
						return '/usr/bin/python'
					end
				end,
			},
		}
	}
end

return {
	get_config = get_config
}
