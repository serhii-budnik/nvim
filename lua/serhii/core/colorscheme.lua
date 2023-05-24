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

-- require('vscode').load()
vim.cmd("colorscheme dayfox")
