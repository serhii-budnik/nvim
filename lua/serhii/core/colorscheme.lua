vim.o.background = 'light'

require('nightfox').setup({
  options = {
    styles = {
      comments = "",
      keywords = "",
      types = "",
    }
  }
})

vim.cmd("colorscheme dayfox")
