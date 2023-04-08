local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'solargraph',
  'ruby_ls',
})

local cmp_mappings = lsp.defaults.cmp_mappings()

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- test ruby lsp
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruby_ls
require'lspconfig'.ruby_ls.setup{}

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  -- update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
