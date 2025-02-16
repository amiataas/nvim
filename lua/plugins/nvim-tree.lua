return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			local nvim_tree = require('nvim-tree')
			local nvim_autocmd = vim.api.nvim_create_autocmd
			local nvim_tree_api = require('nvim-tree.api')
			local window_count = function()
				return #vim.api.nvim_list_wins()
			end

			-- Open directory
			local function open_nvim_tree(data)
				local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
				local directory = vim.fn.isdirectory(data.file) == 1

				if not no_name and not directory then
					return
				end

				if directory then
					vim.cmd.cd(data.file)
				end

				nvim_tree_api.tree.open()
			end
			nvim_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
			-- Auto close on last window
			nvim_autocmd("BufEnter", {
				nested = true,
				callback = function()
					if window_count() == 1 and
							require("nvim-tree.utils").is_nvim_tree_buf() then
						vim.cmd "quit"
					end
				end
			})
			local function on_attach(bufnr)
				local function opts(desc)
					return {
						desc = 'nvim-tree: ' .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				-- Shorthand keymap function
				local keymap = vim.keymap.set

				keymap('n', '<C-b>', nvim_tree_api.tree.toggle, opts('Toggle NvimTree'))
				keymap('n', '<C-]>', nvim_tree_api.tree.change_root_to_node, opts('Change Directory'))
				keymap('n', '<C-e>', nvim_tree_api.node.open.replace_tree_buffer, opts('Open: In Place'))
				keymap('n', '<C-k>', nvim_tree_api.node.show_info_popup, opts('Info'))
				keymap('n', '<C-r>', nvim_tree_api.fs.rename_sub, opts('Rename: Omit Filename'))
				keymap('n', '<C-t>', nvim_tree_api.node.open.tab, opts('Open: New Tab'))
				keymap('n', '<C-v>', nvim_tree_api.node.open.vertical, opts('Open: Vertical Split'))
				keymap('n', '<C-x>', nvim_tree_api.node.open.horizontal, opts('Open: Horizontal Split'))
				keymap('n', '<BS>', nvim_tree_api.node.navigate.parent_close, opts('Close Directory'))
				keymap('n', '<CR>', nvim_tree_api.node.open.edit, opts('Open'))
				keymap('n', '<Tab>', nvim_tree_api.node.open.preview, opts('Open Preview'))
				keymap('n', '>', nvim_tree_api.node.navigate.sibling.next, opts('Next Sibling'))
				keymap('n', '<', nvim_tree_api.node.navigate.sibling.prev, opts('Previous Sibling'))
				keymap('n', '.', nvim_tree_api.node.run.cmd, opts('Run Command'))
				keymap('n', '-', nvim_tree_api.tree.change_root_to_parent, opts('Up'))
				keymap('n', 'a', nvim_tree_api.fs.create, opts('Create'))
				keymap('n', 'bmv', nvim_tree_api.marks.bulk.move, opts('Move Bookmarked'))
				keymap('n', 'B', nvim_tree_api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
				keymap('n', 'c', nvim_tree_api.fs.copy.node, opts('Copy'))
				keymap('n', 'C', nvim_tree_api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
				keymap('n', '[c', nvim_tree_api.node.navigate.git.prev, opts('Prev Git'))
				keymap('n', ']c', nvim_tree_api.node.navigate.git.next, opts('Next Git'))
				keymap('n', 'd', nvim_tree_api.fs.remove, opts('Delete'))
				keymap('n', 'D', nvim_tree_api.fs.trash, opts('Trash'))
				keymap('n', 'E', nvim_tree_api.tree.expand_all, opts('Expand All'))
				keymap('n', 'e', nvim_tree_api.fs.rename_basename, opts('Rename: Basename'))
				keymap('n', ']e', nvim_tree_api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
				keymap('n', '[e', nvim_tree_api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
				keymap('n', 'F', nvim_tree_api.live_filter.clear, opts('Clean Filter'))
				keymap('n', 'f', nvim_tree_api.live_filter.start, opts('Filter'))
				keymap('n', 'g?', nvim_tree_api.tree.toggle_help, opts('Help'))
				keymap('n', 'gy', nvim_tree_api.fs.copy.absolute_path, opts('Copy Absolute Path'))
				keymap('n', 'H', nvim_tree_api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
				keymap('n', 'I', nvim_tree_api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
				keymap('n', 'J', nvim_tree_api.node.navigate.sibling.last, opts('Last Sibling'))
				keymap('n', 'K', nvim_tree_api.node.navigate.sibling.first, opts('First Sibling'))
				keymap('n', 'm', nvim_tree_api.marks.toggle, opts('Toggle Bookmark'))
				keymap('n', 'o', nvim_tree_api.node.open.edit, opts('Open'))
				keymap('n', 'O', nvim_tree_api.node.open.no_window_picker, opts('Open: No Window Picker'))
				keymap('n', 'p', nvim_tree_api.fs.paste, opts('Paste'))
				keymap('n', 'P', nvim_tree_api.node.navigate.parent, opts('Parent Directory'))
				keymap('n', 'q', nvim_tree_api.tree.close, opts('Close'))
				keymap('n', 'r', nvim_tree_api.fs.rename, opts('Rename'))
				keymap('n', 'R', nvim_tree_api.tree.reload, opts('Refresh'))
				keymap('n', 's', nvim_tree_api.node.run.system, opts('Run System'))
				keymap('n', 'S', nvim_tree_api.tree.search_node, opts('Search'))
				keymap('n', 'U', nvim_tree_api.tree.toggle_custom_filter, opts('Toggle Hidden'))
				keymap('n', 'W', nvim_tree_api.tree.collapse_all, opts('Collapse'))
				keymap('n', 'x', nvim_tree_api.fs.cut, opts('Cut'))
				keymap('n', 'y', nvim_tree_api.fs.copy.filename, opts('Copy Name'))
				keymap('n', 'Y', nvim_tree_api.fs.copy.relative_path, opts('Copy Relative Path'))
				keymap('n', '<2-LeftMouse>', nvim_tree_api.node.open.edit, opts('Open'))
				keymap('n', '<2-RightMouse>', nvim_tree_api.tree.change_root_to_node, opts('CD'))
			end

			nvim_tree.setup({
				sort_by = "case_sensitive",
				on_attach = on_attach,
				view = {
					width = 30,
				},
				notify = {
					threshold = vim.log.levels.DEBUG,
				},
				renderer = {
					icons = {
						glyphs = {
							git = {
								unstaged = "",
								staged = "",
								unmerged = "",
								renamed = "󰑕",
								untracked = "",
								deleted = "",
								ignored = "-",
							},
						},
					},
				},
			})
		end,
	}
}
