local cmp = require("cmp")

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    -- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
})
