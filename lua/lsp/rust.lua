-- ┌─────────────────────────┐
-- │ ┬─┐┬ ┬┌─┐┌┬┐  ┬  ┌─┐┌─┐ │
-- │ ├┬┘│ │└─┐ │   │  └─┐├─┘ │
-- │ ┴└─└─┘└─┘ ┴   ┴─┘└─┘┴   │
-- └─────────────────────────┘

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig['rust_analyzer'].setup({
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
			}
		}
	},
})
