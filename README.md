# Neovim Configuration Files
My current Neovim configuration files.

- 📦 Package Manager: [Lazy](https://github.com/folke/lazy.nvim)

## Global Keys
- 🪛 Leader: Space
- [Visual] '<': Unindent selection and don't lose focus.
- [Visual] '>': Indent selection and don't lose focus.

## Theme

- Theme is [Catppuccin](https://github.com/catppuccin/nvim) with mocha flavor.

## Plugins
### [CMP](https://github.com/hrsh7th/nvim-cmp)
#### Mappings
- <Up>: Select previous item.
- <Down>: Select next item.
- <Ctrl> + k: Select previous item.
- <Ctrl> + j: Select next item.
- <Ctrl> + b: Scroll docs down.
- <Ctrl> + f: Scroll docs up.
- <Ctrl> + <Space>: Complete.
- <Ctrl> + e: Close.
- <Enter>: Confirm.
- <Tab>: Next item.

### [DAP](https://github.com/mfussenegger/nvim-dap)
#### Mappings
- <Leader> + d > r: [D]ap Open [R]EPL.
- <Leader> + d > b: [D]ap Toggle [b]reakpoint.
- <Leader> + d > c: [D]ap [c]ontinue.
- <Leader> + d > o: [D]ap step [o]ver.

### [Git Blame](https://github.com/f-person/git-blame.nvim)
### [Indent Guide](https://github.com/lukas-reineke/indent-blankline.nvim)
### [LSP Format](https://github.com/lukas-reineke/lsp-format.nvim)
### [LSP](https://github.com/neovim/nvim-lspconfig)
#### Mappings
- <Leader> + q > f: Quick fix feature.

### [Lua Line](https://github.com/nvim-lualine/lualine.nvim)
### [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)
Globaly:

- <Ctrl> + b: Toggle file explorer.

Locally:

- <Ctrl> + ]: Chnage to selected.
- <Ctrl> + k: Show info.
- <Ctrl> + r: Rename file.
- <Ctrl> + t: Open in new tab.
- <Ctrl> + v: Open in vertical split.
- <Ctrl> + x: Open in horizontal split.
- <Backspace>: Close directory.
- <Enter>: Open.
- <Tab>: Open preview.
- . : Run command on file.
- bmv: [B]ulk [m]ove [b]ackwards.
- x: Cut
- c: [C]opy.
- p: Paste.
- d: Delete.
- D: Trash.
- E: Expand all.
- e: Rename basename.
- F: Clean filter.
- f: Filter.
- H: Toggle Hidden.
- I: Toggle gitignored.
- m: Bookmark
- P: Parent directory.
- s: Open in system.
- S: Search.
- W: Collapse.
- y: Copy name.
- Y: Copy relative path.
### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

Extensions:
- [TelescopeDap](https://github.com/nvim-telescope/telescope-dap.nvim)

## Language Servers
The `lsp.base.lua` file is reserved for copying, any lsp in use should be added to `lsp.lsplist.lua`.

### List
- **Clangd**: Has GDB and CodeLLDB dap.
- **Lua Language Server**
- **Pyright**: Support debugging with debugpy package.
- **Zig Language Server*

For CodeLLDB please install binaries of [codelldb](https://github.com/vadimcn/codelldb) in `~/.local/share/nvim/dap/codelldb`.
