local opt = vim.opt

-- vertical line
opt.colorcolumn = "120"

-- folding
vim.cmd([[
set foldmethod=expr 
set foldexpr=nvim_treesitter#foldexpr() 
set foldlevel=99
set nofoldenable
]])
-- https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1159637962
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = "normal zx",
})

-- keep cursor in the middle of the screen
opt.scrolloff = 25

-- line numbers

opt.relativenumber = true
opt.number = true

-- tabs & indents

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 2 -- experimental

-- line wrapping

opt.wrap = false

-- search settings

opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.opt.updatetime = 50
