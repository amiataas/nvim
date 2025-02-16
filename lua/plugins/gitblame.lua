-- ┌────────────────────────────────────────────┐
-- │ ┌─┐┬┌┬┐  ┌┐ ┬  ┌─┐┌┬┐┌─┐  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌ │
-- │ │ ┬│ │   ├┴┐│  ├─┤│││├┤   ├─┘│  │ ││ ┬││││ │
-- │ └─┘┴ ┴   └─┘┴─┘┴ ┴┴ ┴└─┘  ┴  ┴─┘└─┘└─┘┴┘└┘ │
-- └────────────────────────────────────────────┘

return {
		'f-person/git-blame.nvim',
		lazy = false,
		config = function()
			require('gitblame').setup({
				enabled = true,
				message_template = '     󱚟   <author> 󰜜 <date> 󰜜 <summary>',
				date_format = '%r'
			})
		end
}
