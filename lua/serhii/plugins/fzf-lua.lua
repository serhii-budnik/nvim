local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  files = {
    prompt = 'Files❯ ',
    cwd_prompt = false,
  },
  winopts = {
    preview = {
      layout = "vertical",
    },
  },
})

vim.keymap.set("n", "<leader>fp", fzf_lua.files)
vim.keymap.set("n", "<leader>fo", fzf_lua.oldfiles)
