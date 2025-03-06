-- ┌─────────────────────┐
-- │ ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐ │
-- │ │ │├─┘ │ ││ ││││└─┐ │
-- │ └─┘┴   ┴ ┴└─┘┘└┘└─┘ │
-- └─────────────────────┘

local options = {
	backup = false,
	clipboard = 'unnamedplus',
	ignorecase = true,
	shiftwidth = 2,
	tabstop = 2,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = 'yes',
	autoindent = false,
	smartindent = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config({
  virtual_text = true,
  underline = true
})
