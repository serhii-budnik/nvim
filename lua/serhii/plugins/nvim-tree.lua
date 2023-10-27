local nvimtree = require("nvim-tree")

-- recomended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      resize_window = false,
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
        modified = false,
        diagnostics = false,
        bookmarks = true,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})
