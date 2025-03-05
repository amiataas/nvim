-- ┌──────────────────────────────┐
-- │ ┌┬┐┬─┐┌─┐┌─┐┌─┐┬┌┬┐┌┬┐┌─┐┬─┐ │
-- │  │ ├┬┘├┤ ├┤ └─┐│ │  │ ├┤ ├┬┘ │
-- │  ┴ ┴└─└─┘└─┘└─┘┴ ┴  ┴ └─┘┴└─ │
-- └──────────────────────────────┘

return {
	'nvim-treesitter/nvim-treesitter',
	tag = 'v0.9.3',
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = {
				'c',
				'cpp',
				'rust',
				'toml',
				'lua',
				'python',
				'zig',
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
