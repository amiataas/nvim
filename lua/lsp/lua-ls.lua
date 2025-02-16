-- ┌──────────────────────┐
-- │ ┬  ┬ ┬┌─┐  ┬  ┌─┐┌─┐ │
-- │ │  │ │├─┤  │  └─┐├─┘ │
-- │ ┴─┘└─┘┴ ┴  ┴─┘└─┘┴   │
-- └──────────────────────┘

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig['lua_ls'].setup({
	capabilities = capabilities,

	on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') then
        return
      end
    end
		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = true,
        library = {
          vim.env.VIMRUNTIME,
					'${3rd}/luv/library'
        }
      }
    })
	end,
	settings = {
		Lua = {}
	}
})
