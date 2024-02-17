local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  "max-perf",
  files = {
    prompt = 'Files❯ ',
    cwd_prompt = false,
  },
  winopts = {
    preview = {
      layout = "vertical",
    },
  },
  previewers = {
    bat = {
      theme = 'base16',
    },
  },
  fzf_opts = {['--layout'] = 'reverse-list'}
})

vim.keymap.set("n", "<leader>fp", fzf_lua.files)
vim.keymap.set("n", "<leader>fo", fzf_lua.oldfiles)
vim.keymap.set("n", "<leader>fs", fzf_lua.live_grep)
vim.keymap.set("n", "<leader>fr", fzf_lua.resume)
vim.keymap.set("n", "<leader>fk", fzf_lua.keymaps)
vim.keymap.set("n", "<leader>cs", fzf_lua.colorschemes)
vim.keymap.set("n", "<leader>fh", fzf_lua.help_tags)
