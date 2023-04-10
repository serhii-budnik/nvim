require("bufferline").setup{
  highlights = {
    buffer_selected = {
      -- bg = '<colour-value-here>',
      bold = true,
      italic = false,
    },
  },
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  }
}

