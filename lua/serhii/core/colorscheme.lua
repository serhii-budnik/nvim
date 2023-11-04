vim.o.background = 'light'

require('nightfox').setup({
  palettes = {
    dayfox = {
      bg0 = "#ededed",
      bg1 = "#ffffff",
      bg2 = "#ededed",
      bg3 = "#d0d0d0",
    },
  },
  groups = {
    all = {
      IncSearch = { bg = "palette.sel0" },
    },
  },
  options = {
    styles = {
      comments = "",
      keywords = "",
      types = "",
    }
  }
})

vim.cmd("colorscheme dayfox")
