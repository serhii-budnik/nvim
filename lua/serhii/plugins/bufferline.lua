require("bufferline").setup{
  highlights = {
    buffer_selected = {
      -- bg = '<colour-value-here>',
      bold = true,
      italic = false,
    },
  },
  options = {
    show_buffer_icons = false,
    show_buffer_close_icons = false,
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
