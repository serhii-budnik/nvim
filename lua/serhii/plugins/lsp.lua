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
})

local cmp_mappings = lsp.defaults.cmp_mappings()

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

require'lspconfig'.solargraph.setup {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = require'lspconfig'.util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
}
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
