local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({
    buffer = bufnr,
  })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "solargraph", "tsserver", "rust_analyzer" },
  handlers = {
    lsp.default_setup,
  },
})

local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp.cmp_format({details = false}),
})

lspconfig.solargraph.setup({
  init_options = {
    formatting = false,
  },
  settings = {
    solargraph = {
      diagnostics = false
    }
  },
})

lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.ruby_ls.setup({
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

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = true,
})
