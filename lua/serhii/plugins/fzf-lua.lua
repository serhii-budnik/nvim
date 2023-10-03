local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  winopts = {
    preview = {
      layout = "vertical",
    },
  },
})

vim.keymap.set("n", "<leader>fp", fzf_lua.files)
vim.keymap.set("n", "<leader>fo", fzf_lua.oldfiles)
