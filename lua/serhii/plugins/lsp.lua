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

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.configure('solargraph', {
  init_options = {
    formatting = false,
  },
  settings = {
    solargraph = {
      diagnostics = false
    }
  },
})

lsp.configure("ruby_ls", {
  init_options = {
    -- diagnostics does not work for builtin lsp yet. Added on_attach function to get this working
    enabledFeatures = { "codeActions" },
  },
  on_attach = function(client, bufnr)
    local callback = function()
      local params = vim.lsp.util.make_text_document_params(bufnr)

      client.request(
      'textDocument/diagnostic',
      { textDocument = params },
      function(err, result)
        if err or not result then return end

        vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend('keep', params, { diagnostics = result.items }),
        { client_id = client.id }
        )
      end
      )
    end

    vim.api.nvim_create_autocmd({ 'BufEnter', "InsertLeave", "TextChanged" }, {
      buffer = bufnr,
      callback = callback,
    })
  end
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = true,
})
