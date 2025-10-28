# Neovim Configuration Overview

This document summarizes the main customizations defined in `init.lua`.

## Leader & Core Options
- Leader and local leader are both set to the space key.
- UI and editing tweaks: absolute line numbers, mouse support, shared system clipboard, persistent undo, live substitution previews, `scrolloff=10`, and confirmation prompts before quitting unsaved buffers.
- Window behavior: splits open to the right/bottom, sign column is always visible, faster update and mapping timeouts, and list characters are visible to expose whitespace.
- Indentation aligns with Visual Studio / VS Code defaults: tab, soft tab, and shift widths all set to 4 with spaces expanded.

## Global Keymaps
- `Esc` in normal mode clears search highlights.
- `<leader>q` opens the diagnostics list.
- `Esc Esc` leaves terminal-mode insert state.
- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` move focus between splits.
- `<leader>f` triggers formatting through conform.nvim (also runs on save for most filetypes).

## Telescope Shortcuts
- `<leader>sh` help tags, `<leader>sk` keymaps, `<leader>sf` files, `<leader>ss` pickers, `<leader>sw` word under cursor, `<leader>sg` live grep, `<leader>sd` diagnostics, `<leader>sr` resume, `<leader>s.` recent files.
- `<leader><leader>` lists open buffers.
- `<leader>/` fuzzy finds within the current buffer, `<leader>s/` live greps only open files, and `<leader>sn` searches inside this config.

## LSP Buffer-Local Keymaps
These are attached per buffer when an LSP connects:
- `grn` rename symbol, `gra` code action, `grr` references, `gri` implementation, `grd` definition, `grD` declaration.
- `gO` document symbols, `gW` workspace symbols, `grt` type definition.
- `<leader>th` toggles inlay hints when supported.

## Completion & Snippets
- Autocompletion is powered by `saghen/blink.cmp` with the `enter` preset, so pressing `<CR>` accepts the highlighted item while `<Tab>/<S-Tab>` keep cycling and `<C-Space>` shows documentation.
- LuaSnip is available as the snippet engine, with optional VS Code snippet packs ready to enable.

## Formatting & Diagnostics
- `stevearc/conform.nvim` handles formatting. It prefers language servers but falls back to configured formatter executables such as `stylua`, `prettier`, and `csharpier`; C/C++ are excluded from on-save formatting.
- Diagnostics use rounded floating windows, highlight only errors, and supply Nerd Font gutter icons when available.

## Language Servers & Tooling
- Managed through `mason.nvim`, `mason-lspconfig.nvim`, and `mason-tool-installer.nvim`.
- Servers enabled by default: `lua_ls`, `omnisharp`, `ts_ls` (formatting disabled in favor of external tools), `tailwindcss`, `astro`, `emmet_language_server`, `cssls`, `html`, `jsonls`, and `marksman`.
- Extra tooling installed automatically: `stylua`, `prettier`, `eslint_d`, `markdownlint`, and `csharpier`.

## UI & Editing Enhancements
- Colorscheme: `ellisonleao/gruvbox.nvim` with italics disabled for strings/comments.
- `folke/todo-comments.nvim` highlights TODO-style annotations (signs disabled for a quieter gutter).
- `mini.nvim` modules in use: `mini.ai` (extended text objects), `mini.surround` (surround editing), and `mini.statusline` with a compact `line:column` readout.
- Treesitter installs and auto-updates parsers for languages like Astro, TypeScript, C#, and more, with indent support and additional regex highlighting for Ruby.

## Quality-of-Life Automation
- Yanked text flashes briefly via `vim.hl.on_yank`.
- Diagnostics default to severity sorting, and floating windows display the source when helpful.
- Lazy.nvim provides plugin management with emoji-based UI glyphs when Nerd Fonts are unavailable.
