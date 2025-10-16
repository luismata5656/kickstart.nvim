-- nvim-tree provides a file explorer pane
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  init = function()
    -- disable netrw to allow nvim-tree to manage the explorer UI
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    {
      '<leader>e',
      function()
        require('nvim-tree.api').tree.toggle()
      end,
      desc = 'Toggle file explorer',
    },
  },
  opts = {
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    view = {
      width = 35,
    },
  },
  config = function(_, opts)
    require('nvim-tree').setup(opts)
  end,
}
