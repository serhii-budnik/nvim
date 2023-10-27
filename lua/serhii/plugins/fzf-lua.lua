local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  "telescope",
  files = {
    prompt = 'Files❯ ',
    cwd_prompt = false,
    file_icons = false,
  },
  winopts = {
    preview = {
      layout = "vertical",
    },
  },
  fzf_opts = {['--layout'] = 'reverse-list'}
})

vim.keymap.set("n", "<leader>fp", fzf_lua.files)
vim.keymap.set("n", "<leader>fo", fzf_lua.oldfiles)
vim.keymap.set("n", "<leader>fs", fzf_lua.live_grep)
vim.keymap.set("n", "<leader>fr", fzf_lua.resume)
